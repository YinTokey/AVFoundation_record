//
//  YTRender.h
//  Triangle
//
//  Created by YinjianChen on 2019/7/23.
//  Copyright © 2019 YinTokey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface YTRender : NSObject<MTKViewDelegate>

- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView;


@end

NS_ASSUME_NONNULL_END
