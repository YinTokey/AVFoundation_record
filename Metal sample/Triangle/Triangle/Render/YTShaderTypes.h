//
//  YTShaderTypes.h
//  Triangle
//
//  Created by YinjianChen on 2019/7/23.
//  Copyright © 2019 YinTokey. All rights reserved.
//

#ifndef YTShaderTypes_h
#define YTShaderTypes_h

// Buffer index values shared between shader and C code to ensure Metal shader buffer inputs
// match Metal API buffer set calls.
typedef enum YTVertexInputIndex
{
    YTVertexInputIndexVertices     = 0,
    YTVertexInputIndexViewportSize = 1,
} AAPLVertexInputIndex;

//  This structure defines the layout of vertices sent to the vertex
//  shader. This header is shared between the .metal shader and C code, to guarantee that
//  the layout of the vertex array in the C code matches the layout that the .metal
//  vertex shader expects.
typedef struct
{
    vector_float2 position;
    vector_float4 color;
} YTVertex;


#endif /* YTShaderTypes_h */
