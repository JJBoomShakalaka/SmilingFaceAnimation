//
//  ViewController.m
//  SmilingFaceAnimation
//
//  Created by 王远 on 2017/7/25.
//  Copyright © 2017年 王远. All rights reserved.
//

#import "ViewController.h"
#import "SmilingFaceLoadingAnimationView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SmilingFaceLoadingAnimationView *_animationView = [[SmilingFaceLoadingAnimationView alloc] initWithFrame:CGRectMake(0, -10, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _animationView.backgroundColor = [UIColor clearColor];
    [_animationView startAnimation];
    [self.view addSubview:_animationView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
