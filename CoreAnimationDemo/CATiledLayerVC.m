//
//  CATiledLayerVC.m
//  CoreAnimationDemo
//
//  Created by siping ruan on 17/1/22.
//  Copyright © 2017年 Rasping. All rights reserved.
//

//参考文章1：http://cocoabob.net/?p=120
//参考文章2：http://www.jianshu.com/p/ee5502a1aad3

#import "CATiledLayerVC.h"
#import "PDFScrollView.h"

@interface CATiledLayerVC ()

@end

@implementation CATiledLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CATiledLayer";
    self.view.backgroundColor = [UIColor whiteColor];
    
    PDFScrollView *scrollView = [[PDFScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sf_muni" ofType:@"pdf"];
    [scrollView setPDFPath:filePath];
}

@end
