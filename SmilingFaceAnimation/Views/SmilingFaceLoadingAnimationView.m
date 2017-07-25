//
//  SmilingFaceLoadingAnimationView.m
//  OCTest
//
//  Created by 王远 on 2017/7/19.
//  Copyright © 2017年 王远. All rights reserved.
//

#import "SmilingFaceLoadingAnimationView.h"



#define kPointCenterX 200
#define kPointCenterY 200
#define kRadius 100
#define kWidth 20

#define kPoint1Angle 225
#define kPoint2Angle 315

#define kDefaultSpeed 0.05



@implementation SmilingFaceLoadingAnimationView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];// 先调用父类的initWithFrame方法
    if (self) {
        _centerPointX = kPointCenterX;
        _centerPointY = kPointCenterY;
        _radius = kRadius;
        _boldWidth = kWidth;
        
        _centerPointX = frame.size.width/2;
        _centerPointY = frame.size.height/2;
        _radius = frame.size.height/2*2/5;
        _boldWidth = _radius/5;
    }
    return self;
}

-(void)setBoldWidth:(CGFloat)boldWidth
{
    _boldWidth = boldWidth;
    _radius = (self.frame.size.height-_boldWidth*2)/2;
}

-(void)startAnimation
{
    if (_centerPointX == 0) {
        _centerPointX = kPointCenterX;
    }
    if (_centerPointY == 0) {
        _centerPointY = kPointCenterY;
    }
    sum = 0;
    count = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeAngle) userInfo:nil repeats:YES];
}

-(void)stopAnimation
{
    sum = 4*M_PI/kDefaultSpeed;
    [self setNeedsDisplay];
    [timer invalidate];
}

-(void)changeAngle
{
    sum++;
    [self setNeedsDisplay];
    
    if (sum > 4*M_PI/kDefaultSpeed) {
        sum = 4*M_PI/kDefaultSpeed;
        count++;
        if (count >2/0.01) {
            count = 0;
            sum = 0;
            endSum = 0;
        }
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    float moveAngle = sum*kDefaultSpeed;
    
    /*画填充圆
     */
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor clearColor] set];
    CGContextFillRect(context, rect);
    CGContextSetLineCap(context, kCGLineCapRound);

    
    CGContextSetRGBStrokeColor(context, 255/255.0, 139/255.0, 3/255.0, 1);//#ff8b03
    CGContextSetLineWidth(context, _boldWidth);
    CGContextAddArc(context, _centerPointX, _centerPointY, _radius, moveAngle, M_PI+moveAngle, 0);
    CGContextDrawPath(context, kCGPathStroke);
    
    
    
    if (sum <= M_PI/0.05) {
        CGContextSetRGBStrokeColor(context, 255/255.0, 139/255.0, 3/255.0, 1);
        CGContextMoveToPoint(context, _centerPointX+(_radius)*cos(kPoint1Angle*(M_PI/180)+moveAngle*0.3), _centerPointY+(_radius)*sin(kPoint1Angle*(M_PI/180)+moveAngle*0.3));
        CGContextAddLineToPoint(context, _centerPointX+(_radius)*cos(kPoint1Angle*(M_PI/180)+moveAngle*0.35), _centerPointY+(_radius)*sin(kPoint1Angle*(M_PI/180)+moveAngle*0.35));
        
        CGContextMoveToPoint(context, _centerPointX+(_radius)*cos(kPoint2Angle*(M_PI/180)+moveAngle*0.2), _centerPointY+(_radius)*sin(kPoint2Angle*(M_PI/180)+moveAngle*0.2));
        CGContextAddLineToPoint(context, _centerPointX+(_radius)*cos(kPoint2Angle*(M_PI/180)+moveAngle*0.25), _centerPointY+(_radius)*sin(kPoint2Angle*(M_PI/180)+moveAngle*0.25));
    }else if (sum > M_PI/0.05 && sum <= 3*M_PI/0.05) {
        CGContextSetRGBStrokeColor(context, 255/255.0, 139/255.0, 3/255.0, 1);
        CGContextMoveToPoint(context, _centerPointX+(_radius)*cos(kPoint1Angle*(M_PI/180)+moveAngle-3*M_PI/4), _centerPointY+(_radius)*sin(kPoint1Angle*(M_PI/180)+moveAngle-3*M_PI/4));
        CGContextAddLineToPoint(context, _centerPointX+(_radius)*cos(kPoint1Angle*(M_PI/180)+moveAngle-3*M_PI/4), _centerPointY+(_radius)*sin(kPoint1Angle*(M_PI/180)+moveAngle-3*M_PI/4));
        
        CGContextMoveToPoint(context, _centerPointX+(_radius)*cos(kPoint2Angle*(M_PI/180)+moveAngle-3*M_PI/4), _centerPointY+(_radius)*sin(kPoint2Angle*(M_PI/180)+moveAngle-3*M_PI/4));
        CGContextAddLineToPoint(context, _centerPointX+(_radius)*cos(kPoint2Angle*(M_PI/180)+moveAngle-3*M_PI/4), _centerPointY+(_radius)*sin(kPoint2Angle*(M_PI/180)+moveAngle-3*M_PI/4));
    }else if (sum > 3*M_PI/0.05 && sum <= 4*M_PI/0.05){
        if (endSum*0.05 < 3*M_PI/4) {
            endSum++;
        }
        //大变小，复位
        CGContextSetRGBStrokeColor(context, 255/255.0, 139/255.0, 3/255.0, 1);
        CGContextMoveToPoint(context, _centerPointX+(_radius)*cos(kPoint1Angle*(M_PI/180)+moveAngle-3*M_PI/4+endSum*0.05), _centerPointY+(_radius)*sin(kPoint1Angle*(M_PI/180)+moveAngle-3*M_PI/4+endSum*0.05));
        CGContextAddLineToPoint(context, _centerPointX+(_radius)*cos(kPoint1Angle*(M_PI/180)+moveAngle-3*M_PI/4+endSum*0.05), _centerPointY+(_radius)*sin(kPoint1Angle*(M_PI/180)+moveAngle-3*M_PI/4+endSum*0.05));
        
        CGContextMoveToPoint(context, _centerPointX+(_radius)*cos(kPoint2Angle*(M_PI/180)+moveAngle-3*M_PI/4+endSum*0.05), _centerPointY+(_radius)*sin(kPoint2Angle*(M_PI/180)+moveAngle-3*M_PI/4+endSum*0.05));
        CGContextAddLineToPoint(context, _centerPointX+(_radius)*cos(kPoint2Angle*(M_PI/180)+moveAngle-3*M_PI/4+endSum*0.05), _centerPointY+(_radius)*sin(kPoint2Angle*(M_PI/180)+moveAngle-3*M_PI/4+endSum*0.05));
    }else{
        CGContextSetRGBStrokeColor(context, 255/255.0, 139/255.0, 3/255.0, 1);
        CGContextMoveToPoint(context, _centerPointX+(_radius)*cos((kPoint1Angle+moveAngle)*(M_PI/180)), _centerPointY+(_radius)*sin((kPoint1Angle+moveAngle)*(M_PI/180)));
        CGContextAddLineToPoint(context, _centerPointX+(_radius)*cos((kPoint1Angle+moveAngle)*(M_PI/180)), _centerPointY+(_radius)*sin((kPoint1Angle+moveAngle)*(M_PI/180)));
        
        CGContextMoveToPoint(context, _centerPointX+(_radius)*cos((kPoint2Angle+moveAngle)*(M_PI/180)), _centerPointY+(_radius)*sin((kPoint2Angle+moveAngle)*(M_PI/180)));
        CGContextAddLineToPoint(context, _centerPointX+(_radius)*cos((kPoint2Angle+moveAngle)*(M_PI/180)), _centerPointY+(_radius)*sin((kPoint2Angle+moveAngle)*(M_PI/180)));
    }
    CGContextStrokePath(context);

}

@end
