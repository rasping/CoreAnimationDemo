//
//  TiledPDFView.h
//  展示PDF文件
//
//  Created by siping ruan on 17/2/5.
//  Copyright © 2017年 Rasping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiledPDFView : UIView

@property (readwrite, nonatomic) CGPDFPageRef pdfPage;
@property (assign, nonatomic) CGFloat scale;

@end
