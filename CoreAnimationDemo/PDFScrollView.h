//
//  PDFScrollView.h
//  展示PDF文件
//
//  Created by siping ruan on 17/2/6.
//  Copyright © 2017年 Rasping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFScrollView : UIScrollView

/**
 设置PDF文件路径
 */
- (void)setPDFPath:(NSString *)path;

@end
