//
//  CAGradientLayerVC.m
//  CoreAnimationDemo
//
//  Created by siping ruan on 17/1/21.
//  Copyright © 2017年 Rasping. All rights reserved.
//

//参考文章：http://www.saitjr.com/ios/happy-layer-friends-gradientlayer-mask.html

#import "CAGradientLayerVC.h"

@interface CAGradientLayerVC ()

@end

@implementation CAGradientLayerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"CAGradientLayer";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self gradientAnimation];
}

- (void)gradientAnimation
{
    //backgroundImageView
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 95);
    bgImageView.center = self.view.center;
    bgImageView.image = [UIImage imageNamed:@"unlock"];
    [self.view addSubview:bgImageView];
    
    
    //textLayer
    UILabel *label = [[UILabel alloc] init];
    label.text = @" Rasping Rasping Rasping";
    CGFloat pX = 125;
    CGFloat pY = bgImageView.frame.size.height * 0.5 - 10;
    label.center = CGPointMake(pX, pY);
    [label sizeToFit];
    [bgImageView addSubview:label];
    
    //gradientLayer
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = label.frame;
    layer.colors = @[(__bridge id)[UIColor grayColor].CGColor, (__bridge id)[UIColor whiteColor].CGColor, (__bridge id)[UIColor grayColor].CGColor];
    layer.locations = @[@(0.25), @(0.5), @(0.75)];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 0);
    [bgImageView.layer addSublayer:layer];
    
    layer.mask = label.layer;
    label.frame = layer.bounds;
    
    //animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.fromValue = @[@(0.0), @(0.0), @(0.25)];
    animation.toValue = @[@(0.75), @(1.0), @(1.0)];
    animation.duration = 2.5;
    animation.repeatCount = CGFLOAT_MAX;
    [layer addAnimation:animation forKey:nil];
}

@end
