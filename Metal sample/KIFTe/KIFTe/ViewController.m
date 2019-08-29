//
//  ViewController.m
//  KIFTe
//
//  Created by YinjianChen on 2019/8/29.
//  Copyright © 2019 YinTokey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 100);
    
    [btn setAccessibilityLabel:@"red_btn"];
}


- (void)touch{
    NSLog(@"click");
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor yellowColor];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
