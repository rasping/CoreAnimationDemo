//
//  PDFScrollView.m
//  展示PDF文件
//
//  Created by siping ruan on 17/2/6.
//  Copyright © 2017年 Rasping. All rights reserved.
//

#import "PDFScrollView.h"
#import "TiledPDFView.h"

@interface PDFScrollView ()<UIScrollViewDelegate>

@property (assign, nonatomic) CGRect pageRect;
@property (readwrite, nonatomic) CGPDFPageRef pdfPage;
@property (assign, nonatomic) CGFloat PDFScale;
@property (weak, nonatomic) TiledPDFView *frontTiledView;
@property (weak, nonatomic) TiledPDFView *backTiledView;
@property (copy, nonatomic) NSString *path;

@end

@implementation PDFScrollView

#pragma mark - Setter/Getter

- (CGPDFPageRef)pdfPage
{
    if (_pdfPage == NULL) {
        CGPDFDocumentRef pdfDocument = CGPDFDocumentCreateWithURL((__bridge CFURLRef)[NSURL fileURLWithPath:self.path]);
        _pdfPage = CGPDFDocumentGetPage(pdfDocument, 1);
    }
    return _pdfPage;
}

#pragma mark - Initialize

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialze];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialze];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //将tiledPDFView移动到屏幕中间
    CGSize size = self.bounds.size;
    CGRect frameToCenter = self.frontTiledView.frame;
    if (frameToCenter.size.width < size.width) {
        frameToCenter.origin.x = (size.width - frameToCenter.size.width) * 0.5;
    } else {
        frameToCenter.origin.x = 0;
    }
    
    if (frameToCenter.size.height < size.height) {
        frameToCenter.origin.y = (size.height - frameToCenter.size.height) * 0.5;
    } else {
        frameToCenter.origin.y = 0;
    }
    
    self.frontTiledView.frame = frameToCenter;
}

#pragma mark - Public

- (void)setPDFPath:(NSString *)path
{
    self.path = path;
    
    TiledPDFView *tiledPDFView = [[TiledPDFView alloc] init];
    tiledPDFView.pdfPage = self.pdfPage;
    
    tiledPDFView.pdfPage = self.pdfPage;
    self.pageRect = CGPDFPageGetBoxRect(self.pdfPage, kCGPDFMediaBox);
    self.PDFScale = self.frame.size.width/self.pageRect.size.width;
    self.pageRect = CGRectMake( self.pageRect.origin.x, self.pageRect.origin.y, self.pageRect.size.width*_PDFScale, self.pageRect.size.height*_PDFScale );
    tiledPDFView.scale = self.PDFScale;
    tiledPDFView.frame = self.pageRect;
    
    [self addSubview:tiledPDFView];
    self.frontTiledView = tiledPDFView;
}

#pragma mark - Private

//scrollView的初始化配置
- (void)initialze
{
    self.decelerationRate = UIScrollViewDecelerationRateFast;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.delegate = self;
    self.bouncesZoom = YES;
    self.maximumZoomScale = 5.0;
    self.minimumZoomScale = 0.25;
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.frontTiledView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    [self.backTiledView removeFromSuperview];
    self.backTiledView = self.frontTiledView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    TiledPDFView *tiledPDFView = [[TiledPDFView alloc] init];
    tiledPDFView.pdfPage = self.pdfPage;
    self.PDFScale *= scale;
    tiledPDFView.scale = self.PDFScale;
    tiledPDFView.frame = self.backTiledView.frame;
    [self addSubview:tiledPDFView];
    self.frontTiledView = tiledPDFView;
}

@end
