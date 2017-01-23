//
//  CALayerVC.m
//  CoreAnimationDemo
//
//  Created by siping ruan on 17/1/21.
//  Copyright © 2017年 Rasping. All rights reserved.
//

//参考文章：http://www.cnblogs.com/kenshincui/p/3972100.html#overview

#import "CALayerVC.h"

@interface CALayerVC ()

@property (weak, nonatomic) CALayer *layer;

@end

@implementation CALayerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"CALayer";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addOwnViews];
}

#pragma mark - Private

- (void)addOwnViews
{
    //btn
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftBtn setTitle:@"隐式动画" forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    leftBtn.center = CGPointMake(self.view.center.x, 100);
    [leftBtn addTarget:self action:@selector(implicitAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    //testLayer
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = self.view.center;
    layer.backgroundColor = [self randomColor].CGColor;
    layer.cornerRadius = 10;
    layer.borderWidth = 2;
    layer.borderColor = [self randomColor].CGColor;
    layer.shadowOffset = CGSizeMake(6, 7);
    layer.shadowRadius = 1;
    layer.shadowColor = [self randomColor].CGColor;
    layer.shadowOpacity = 0.8;
    layer.masksToBounds = YES;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}

- (void)implicitAnimation
{
    [CATransaction begin];
    [CATransaction setDisableActions:NO];
    [CATransaction setAnimationDuration:1.0f];
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    self.layer.bounds = CGRectMake(arc4random_uniform(w), arc4random_uniform(h - 120) + 120, arc4random_uniform(200), arc4random_uniform(200));
    self.layer.position = CGPointMake(arc4random_uniform(300) + 100, arc4random_uniform(400) + 100);
    self.layer.backgroundColor = [self randomColor].CGColor;
    self.layer.borderColor = [self randomColor].CGColor;
    self.layer.shadowColor = [self randomColor].CGColor;
    self.layer.cornerRadius = arc4random_uniform(self.layer.bounds.size.width);
    [CATransaction commit];
}

- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256) /255.0;
    CGFloat g = arc4random_uniform(256) /255.0;
    CGFloat b = arc4random_uniform(256) /255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
