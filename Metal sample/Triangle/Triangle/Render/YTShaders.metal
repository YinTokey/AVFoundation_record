//
//  YTShaders.metal
//  Triangle
//
//  Created by YinjianChen on 2019/7/23.
//  Copyright © 2019 YinTokey. All rights reserved.
//

#include <metal_stdlib>
#include <simd/simd.h>

#import "YTShaderTypes.h"

using namespace metal;

typedef struct
{
    // The [[position]] attribute of this member indicates that this value
    // is the clip space position of the vertex when this structure is
    // returned from the vertex function.
    float4 position [[position]];
    
    // Since this member does not have a special attribute, the rasterizer
    // interpolates its value with the values of the other triangle vertices
    // and then passes the interpolated value to the fragment shader for each
    // fragment in the triangle.
    float4 color;
    
} RasterizerData;

vertex RasterizerData
vertexShader(uint vertexID [[vertex_id]],
             constant YTVertex *vertices [[buffer(YTVertexInputIndexVertices)]],
             constant vector_uint2 *viewportSizePointer [[buffer(YTVertexInputIndexViewportSize)]])
{
    RasterizerData out;
    
    // Index into the array of positions to get the current vertex.
    // The positions are specified in pixel dimensions (i.e. a value of 100
    // is 100 pixels from the origin).
    float2 pixelSpacePosition = vertices[vertexID].position.xy;
    
    // Get the viewport size and cast to float.
    vector_float2 viewportSize = vector_float2(*viewportSizePointer);
    
    
    // To convert from positions in pixel space to positions in clip-space,
    //  divide the pixel coordinates by half the size of the viewport.
    out.position = vector_float4(0.0, 0.0, 0.0, 1.0);
    out.position.xy = pixelSpacePosition / (viewportSize / 2.0);
    
    // Pass the input color directly to the rasterizer.
    out.color = vertices[vertexID].color;
    
    return out;
}

fragment float4 fragmentShader(RasterizerData in [[stage_in]])
{
    // Return the interpolated color.
    return in.color;
}


