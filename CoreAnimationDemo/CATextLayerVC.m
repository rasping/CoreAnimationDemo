//
//  CATextLayerVC.m
//  CoreAnimationDemo
//
//  Created by siping ruan on 17/2/7.
//  Copyright © 2017年 Rasping. All rights reserved.
//

#import "CATextLayerVC.h"
#import "ScrollLabel.h"

@interface CATextLayerVC ()

@end

@implementation CATextLayerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"CATextLayer";
    self.view.backgroundColor = [UIColor whiteColor];
    
    ScrollLabel *label = [[ScrollLabel alloc] init];
    label.frame = CGRectMake(0, 0, 100, 30);
    [self.view addSubview:label];
}



@end
