//
//  ViewController.m
//  AppiumGrowing
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

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor blueColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)click{
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}



@end
