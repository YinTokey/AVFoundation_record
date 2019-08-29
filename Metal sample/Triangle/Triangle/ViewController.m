//
//  ViewController.m
//  Triangle
//
//  Created by YinjianChen on 2019/7/23.
//  Copyright © 2019 YinTokey. All rights reserved.
//

#import "ViewController.h"
#import "YTRender.h"

@implementation ViewController
{
    YTRender *_render;
    MTKView *_mtkView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    // Set the view to use the default device
    _mtkView = [[MTKView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_mtkView];
    
    _mtkView.device = MTLCreateSystemDefaultDevice();
    
    _render = [[YTRender alloc]initWithMetalKitView:_mtkView];
    
    [_render mtkView:_mtkView drawableSizeWillChange:_mtkView.drawableSize];
    
    _mtkView.delegate = _render;
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
