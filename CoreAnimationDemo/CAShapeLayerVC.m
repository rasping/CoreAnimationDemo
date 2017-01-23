//
//  CAShapeLayerVC.m
//  CoreAnimationDemo
//
//  Created by siping ruan on 17/1/21.
//  Copyright © 2017年 Rasping. All rights reserved.
//

//参考文章：http://www.cocoachina.com/ios/20161202/18252.html

#import "CAShapeLayerVC.h"

#define Color(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

typedef NS_ENUM(NSInteger, PathType) {
    PathTypeSin,
    PathTypeCos
};

@interface CAShapeLayerVC ()

@property (weak, nonatomic) CALayer *containerLayer;
@property (weak, nonatomic) CAShapeLayer *sinLayer;
@property (weak, nonatomic) CAShapeLayer *cosLayer;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (assign, nonatomic) CGFloat phase;

//常量
@property (assign, nonatomic) CGFloat containerWH;
@property (assign, nonatomic) CGFloat speed;
@property (assign, nonatomic) CGFloat amplitude;//振幅A
@property (assign, nonatomic) CGFloat variable;//偏移量 k
@property (assign, nonatomic) CGFloat unit;//单位像素对应的弧度

@end

@implementation CAShapeLayerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"CAShapeLayer";
    self.view.backgroundColor = Color(53, 174, 152, 1.0);
    
    [self addWaveProgressView];
    
}

- (void)addWaveProgressView
{
    CALayer *containerLayer = [CALayer layer];
    self.containerWH = 130;
    containerLayer.bounds = CGRectMake(0, 0, self.containerWH, self.containerWH);
    containerLayer.position = self.view.center;
    containerLayer.masksToBounds = YES;
    containerLayer.cornerRadius = self.containerWH * 0.5;
    containerLayer.backgroundColor = [UIColor clearColor].CGColor;
    containerLayer.borderColor = [UIColor whiteColor].CGColor;
    containerLayer.borderWidth = 5.0;
    containerLayer.allowsEdgeAntialiasing = YES;//动画时消锯齿
    [self.view.layer addSublayer:containerLayer];
    self.containerLayer = containerLayer;
    
    //长量赋值
    self.amplitude = self.containerWH * 0.05;
    self.variable = self.containerWH * 0.5;
    self.unit = 2.0 * M_PI / self.containerWH;//单位像素对应的弧度
    self.speed = 1.0;
    
    CAShapeLayer *sinLayer = [CAShapeLayer layer];
    sinLayer.frame = containerLayer.bounds;
    sinLayer.backgroundColor = [UIColor clearColor].CGColor;
    sinLayer.fillColor = [UIColor whiteColor].CGColor;
    sinLayer.opacity = 0.8;
    sinLayer.path = [self createPathWithType:PathTypeSin].CGPath;
    sinLayer.lineWidth = 3.0;
    sinLayer.lineJoin = kCALineJoinRound;
    sinLayer.lineCap = kCALineCapRound;
    [containerLayer addSublayer:sinLayer];
    self.sinLayer = sinLayer;
    
    CAShapeLayer *cosLayer = [CAShapeLayer layer];
    cosLayer.frame = containerLayer.bounds;
    cosLayer.backgroundColor = [UIColor clearColor].CGColor;
    cosLayer.fillColor = [UIColor whiteColor].CGColor;
    cosLayer.path = [self createPathWithType:PathTypeCos].CGPath;
    cosLayer.lineWidth = 3.0;
    cosLayer.lineJoin = kCALineJoinRound;
    cosLayer.lineCap = kCALineCapRound;
    [containerLayer addSublayer:cosLayer];
    self.cosLayer = cosLayer;
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(moveWave)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                       forMode:NSRunLoopCommonModes];
}

- (UIBezierPath *)createPathWithType:(PathType)type
{
    //y=Asin(ωx+φ)+k
    UIBezierPath *wavePath = [UIBezierPath bezierPath];
    CGFloat endX = 0;
    for (CGFloat x = 0; x <= self.containerWH; x++) {
        endX=x;
        CGFloat y;
        if (type == PathTypeSin) {
            y = self.amplitude * sinf(self.unit * x + self.phase * self.unit) + self.variable;
        }else {
            y = self.amplitude * cosf(self.unit * x + self.phase * self.unit) + self.variable;
        }
        if (x == 0) {
            [wavePath moveToPoint:CGPointMake(x, y)];
        } else {
            [wavePath addLineToPoint:CGPointMake(x, y)];
        }
    }
    
    [wavePath addLineToPoint:CGPointMake(self.containerWH, self.containerWH)];
    [wavePath addLineToPoint:CGPointMake(0, self.containerWH)];
    
    return wavePath;
}

- (void)moveWave
{
    self.phase += self.speed;//累加初相
    self.variable += 0.2 * sinf(self.phase * self.unit);
    self.sinLayer.path = [self createPathWithType:PathTypeSin].CGPath;
    self.cosLayer.path = [self createPathWithType:PathTypeCos].CGPath;
}


@end
