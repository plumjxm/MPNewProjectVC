//
//  MPCircleView.m
//  tenMS
//
//  Created by plum on 17/6/29.
//  Copyright © 2017年 plum. All rights reserved.
//

#import "MPCircleView.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface MPCircleView ()
@end

@implementation MPCircleView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initView];
        
    }
    return self;
}
#pragma mark - Private
- (void)initView
{
    
    CGFloat selfW = self.width;
    
    ///虚线圆View=============
    self.layer.cornerRadius = selfW/2;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
    self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    CGFloat lineWidth = 22.0;
    CGFloat left = 2;
    CGFloat width = selfW-left*2;
    //  第一层浅白色的虚线圆
    CAShapeLayer *ovalLayer = [CAShapeLayer layer];
    ovalLayer.strokeColor = [UIColor colorWithRed:0.64 green:0.71 blue:0.87 alpha:0.2].CGColor;
    ovalLayer.fillColor = [UIColor clearColor].CGColor;
    ovalLayer.lineWidth = lineWidth;
    //线的宽度  每条线的间距
    ovalLayer.lineDashPattern  = @[@2,@6];
    ovalLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(left,left,width,width)].CGPath;
    [self.layer addSublayer:ovalLayer];
    // 第二层黄色的虚线圆 电量多少的
    self.ovalShapeLayer = [CAShapeLayer layer];
    self.ovalShapeLayer.strokeColor = [UIColor yellowColor].CGColor;
    self.ovalShapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.ovalShapeLayer.lineWidth = lineWidth;
    self.ovalShapeLayer.lineDashPattern  = @[@2,@6];
    self.ovalShapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(left,left,width,width)].CGPath;
    self.ovalShapeLayer.strokeEnd = 0;
    [self.layer addSublayer:self.ovalShapeLayer];

    //设置渐变颜色
    UIColor *endcolor =   [UIColor redColor];
    UIColor *startcolor = [UIColor greenColor];

    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)[startcolor CGColor],(id)[endcolor CGColor], nil]];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    [gradientLayer setMask:self.ovalShapeLayer]; //用progressLayer来截取渐变层
    [self.layer addSublayer:gradientLayer];

}
#pragma mark - Getter

#pragma mark - Setter
@end
