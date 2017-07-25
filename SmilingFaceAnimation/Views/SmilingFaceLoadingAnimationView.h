//
//  SmilingFaceLoadingAnimationView.h
//  OCTest
//
//  Created by 王远 on 2017/7/19.
//  Copyright © 2017年 王远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmilingFaceLoadingAnimationView : UIView
{
    NSTimer *timer;
    NSInteger sum;
    NSInteger count;
    
    NSInteger endSum;
}

@property (nonatomic , assign) CGFloat centerPointX;
@property (nonatomic , assign) CGFloat centerPointY;

@property (nonatomic , assign) CGFloat radius;
@property (nonatomic , assign) CGFloat boldWidth;


- (id)initWithFrame:(CGRect)frame;

#pragma mark - 开始做动画
-(void)startAnimation;
#pragma mark - 动画停止
-(void)stopAnimation;
@end
