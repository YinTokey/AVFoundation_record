//
//  YTRender.m
//  Triangle
//
//  Created by YinjianChen on 2019/7/23.
//  Copyright © 2019 YinTokey. All rights reserved.
//

#import "YTRender.h"
#import "YTShaderTypes.h"


@implementation YTRender
{
    id<MTLDevice> _device;
    
    id<MTLRenderPipelineState> _pipelinState;
    
    id<MTLCommandQueue> _commandQueue;
    
    vector_uint2 _viewportSize;
}


- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView{
    
    if(self = [super init]){
        NSError *error =  NULL;
        
        _device = mtkView.device;
        
        id<MTLLibrary> libriry = [_device newDefaultLibrary];
        
        id<MTLFunction> vertexFunction = [libriry newFunctionWithName:@"vertexShader"];
        id<MTLFunction> fragmentFunction = [libriry newFunctionWithName:@"fragmentShader"];
        
        MTLRenderPipelineDescriptor *pipelineStateDescriptor = [[MTLRenderPipelineDescriptor alloc] init];
        pipelineStateDescriptor.label = @"Simple Pipeline";
        pipelineStateDescriptor.vertexFunction = vertexFunction;
        pipelineStateDescriptor.fragmentFunction = fragmentFunction;
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = mtkView.colorPixelFormat;
        
        _pipelinState = [_device newRenderPipelineStateWithDescriptor:pipelineStateDescriptor error:&error];
        
        _commandQueue = [_device newCommandQueue];
    }
    
    
    
    return self;
}

/// Called whenever the view needs to render a frame.
- (void)drawInMTKView:(nonnull MTKView *)view {
    static const YTVertex triangleVertices[] =
    {
        // 2D positions,    RGBA colors
        { {  20,  -250 }, { 1, 10, 0, 1 } },
        { { -250,  -250 }, { 0, 1, 0, 1 } },
        { {    0,   250 }, { 0, 0, 1, 1 } },
    };
    
    // Create a new command buffer for each render pass to the current drawable.
    id<MTLCommandBuffer> commandBuffer = [_commandQueue commandBuffer];
    commandBuffer.label = @"MyCommand";
    
    // Obtain a renderPassDescriptor generated from the view's drawable textures.
    MTLRenderPassDescriptor *renderPassDescriptor = view.currentRenderPassDescriptor;
    
    if(renderPassDescriptor != nil)
    {
        // Create a render command encoder.
        id<MTLRenderCommandEncoder> renderEncoder =
        [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        renderEncoder.label = @"MyRenderEncoder";
        
        // Set the region of the drawable to draw into.
        [renderEncoder setViewport:(MTLViewport){0.0, 0.0, _viewportSize.x, _viewportSize.y, 0.0, 1.0 }];
        
        [renderEncoder setRenderPipelineState:_pipelinState];
        
        // Pass in the parameter data.
        [renderEncoder setVertexBytes:triangleVertices
                               length:sizeof(triangleVertices)
                              atIndex:YTVertexInputIndexVertices];
        
        [renderEncoder setVertexBytes:&_viewportSize
                               length:sizeof(_viewportSize)
                              atIndex:YTVertexInputIndexViewportSize];
        
        // Draw the triangle.
        [renderEncoder drawPrimitives:MTLPrimitiveTypeTriangle
                          vertexStart:0
                          vertexCount:3];
        
        [renderEncoder endEncoding];
        
        // Schedule a present once the framebuffer is complete using the current drawable.
        [commandBuffer presentDrawable:view.currentDrawable];
    }
    
    // Finalize rendering here & push the command buffer to the GPU.
    [commandBuffer commit];
}

/// Called whenever view changes orientation or is resized
- (void)mtkView:(nonnull MTKView *)view drawableSizeWillChange:(CGSize)size {
    // Save the size of the drawable to pass to the vertex shader.
    _viewportSize.x = size.width;
    _viewportSize.y = size.height;
}

@end
