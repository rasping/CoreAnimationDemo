//
//  TiledPDFView.m
//  展示PDF文件
//
//  Created by siping ruan on 17/2/5.
//  Copyright © 2017年 Rasping. All rights reserved.
//

#import "TiledPDFView.h"

@implementation TiledPDFView

+ (Class)layerClass
{
    return [CATiledLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentScaleFactor = 1.0;
        
        CATiledLayer *layer = (CATiledLayer *)self.layer;
        layer.levelsOfDetail = 4;
        layer.levelsOfDetailBias = 4;
        layer.tileSize = CGSizeMake(512.0, 512.0);
        
        //初始值
        self.scale = 1.0;
    }
    return self;
}

- (void)setPdfPage:(CGPDFPageRef)pdfPage
{
    if (pdfPage) {
        if (_pdfPage) {
            CGPDFPageRelease(_pdfPage);
        }
        //在引用之前，先释放掉上一次引用的
        _pdfPage = CGPDFPageRetain(pdfPage);
    }
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 1.0,1.0,1.0,1.0);
    CGContextFillRect(ctx, self.bounds);
    if (self.pdfPage) {
        CGContextSaveGState(ctx);
        CGContextTranslateCTM(ctx, 0.0, CGRectGetHeight(self.bounds));
        CGContextScaleCTM(ctx, 1.0, -1.0);
        CGContextScaleCTM(ctx, self.scale, self.scale);
        CGContextDrawPDFPage(ctx, self.pdfPage);
        CGContextRestoreGState(ctx);
    }
}

- (void)dealloc
{
    CGPDFPageRelease(self.pdfPage);
}

@end
