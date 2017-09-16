//
//  ViewController.m
//  MPNewProjectVC
//
//  Created by plum on 17/9/16.
//  Copyright © 2017年 plum. All rights reserved.
//

#import "ViewController.h"
#import "MPCircleView.h"

@interface ViewController ()
@property (weak, nonatomic) MPCircleView *circleView;

@property (weak, nonatomic) UILabel *contentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat left = 80;
    CGFloat width = self.view.width - left*2;
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(left, 70, width, 20)];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    [self.view addSubview:slider];
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];// 针对值变化添加响应方法
    
    CGFloat top = slider.bottom+30;
   
    MPCircleView *secCircle = [[MPCircleView alloc]initWithFrame:CGRectMake(left, top, width, width)];
    [self.view addSubview:secCircle];
    self.circleView = secCircle;

    
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(left, secCircle.center.y-30, width, 50)];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.font = [UIFont systemFontOfSize:22];
    contentLabel.textColor = [UIColor redColor];
    [self.view addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    
    CGFloat pro = 0.6;
    slider.value = pro;
    contentLabel.text = [NSString stringWithFormat:@"%.0f%%",pro*100];
    _circleView.ovalShapeLayer.strokeEnd = pro;



}

// slider变动时改变label值
- (void)sliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    
    CGFloat pro = slider.value;
    _circleView.ovalShapeLayer.strokeEnd = pro;
    _contentLabel.text = [NSString stringWithFormat:@"%.0f%%",pro*100];
   
}


@end
