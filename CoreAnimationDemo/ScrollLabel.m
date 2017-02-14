//
//  ScrollLabel.m
//  CoreAnimationDemo
//
//  Created by siping ruan on 17/2/13.
//  Copyright © 2017年 Rasping. All rights reserved.
//

#import "ScrollLabel.h"

@implementation ScrollLabel

#pragma mark - Initialized

+ (Class)layerClass
{
    return [CAScrollLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CAScrollLayer *scrollLayer = (CAScrollLayer *)self.layer;
        scrollLayer.scrollMode = kCAScrollBoth;
        
    }
    return self;
}

//- (void)drawRect:(CGRect)rect
//{
//    [super drawRect:rect];
//}

@end
