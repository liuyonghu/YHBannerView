//
//  YHBannerView.m
//  境外易购
//
//  Created by victorLiu on 2017/11/14.
//  Copyright © 2017年 刘勇虎. All rights reserved.
//


#define sWdith    self.frame.size.width
#define sHeight   self.frame.size.height
#define defultOffset  CGPointMake(sWdith, 0)

#import "YHBannerView.h"
#import "BannerImageView.h"
#import "ImageInfoData.h"
#import "UIColor+GetRGBWithHexadecimalColor.h"

@interface YHBannerView ()<UIScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,assign)BOOL scrollRight;
@property(nonatomic,assign)NSInteger pageNumber;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)UIScrollView  *backScrollView;
@end

@implementation YHBannerView

- (instancetype)initWithFrame:(CGRect)frame withTargetViewController:(UIViewController *)targetViewController andImageInfoArray:(NSArray <ImageInfoData *>*)imageInfoArray  withPaceholder:(NSString *)placeholder{
    
//    NSLog(@"imageArray = %@",imageArray);
    if (self ==  [super initWithFrame:frame]) {
        self.backScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        
        [self addSubview:self.backScrollView];
        
        
        if (@available(iOS 11.0, *)) {
            self.backScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            targetViewController.automaticallyAdjustsScrollViewInsets = NO;
            // Fallback on earlier versions
        }
        
        self.pageNumber = 0;
        self.backScrollView.delegate = self;
        self.backScrollView.bounces = NO;
        self.imageArray = [NSMutableArray array];
        if (imageInfoArray != nil && imageInfoArray.count > 0) {
            for (NSInteger i = 0; i < imageInfoArray.count +2; i ++) {
                if (i == 0) {
                    ImageInfoData *infoData = imageInfoArray.lastObject;
                    [self.imageArray addObject:infoData];
                    continue;
                }
                
                if (i == (imageInfoArray.count +1)) {
                    ImageInfoData *infoData = imageInfoArray.firstObject;
                    [self.imageArray addObject:infoData];
                    continue;
                }
                
                ImageInfoData *infoData = imageInfoArray[i-1];
                [self.imageArray addObject:infoData];
            }
        }
        self.target = targetViewController;
        self.backScrollView.pagingEnabled = YES;
        self.backScrollView.contentOffset = defultOffset;
        
        self.backgroundColor = [UIColor whiteColor];
        if (_imageArray != nil && _imageArray.count >0) {
            self.backScrollView.contentSize = CGSizeMake((_imageArray.count)*sWdith,sHeight);
            for (NSInteger i = 0; i < _imageArray.count; i ++) {
                BannerImageView *bannerImageV = [[BannerImageView alloc]initWithFrame:CGRectMake(i * sWdith , 0, sWdith, sHeight) withInfoData:_imageArray[i]  addTarget:self.target withPlaceholder:placeholder];
                
                if ([_imageArray[i] isKindOfClass:[NSDictionary class]]) {
                    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(sWdith/2-30, sHeight/2-20, 60, 40)];
                    label.text = [NSString stringWithFormat:@"%ld",(i)];
                    label.font = [UIFont systemFontOfSize:50];
                    [bannerImageV addSubview:label];
                }
                [self.backScrollView addSubview:bannerImageV];
            }
            
        }
        self.backScrollView.showsVerticalScrollIndicator = NO;
        self.backScrollView.showsHorizontalScrollIndicator = NO;
        self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, frame.size.height-17, frame.size.width/2.5, 15)];
        self.pageControl.currentPage = _pageNumber;
        self.pageControl.pageIndicatorTintColor = [UIColor  getRGBWithHexadecimalColor:@"#D8D8D8"];
        self.pageControl.currentPageIndicatorTintColor = [UIColor getRGBWithHexadecimalColor:@"#9B9B9B"];
        self.pageControl.numberOfPages = _imageArray.count -2;
        [self addSubview:self.pageControl];
        
        
        [self.bannnerTimer fire];
    }
    return self;
}

#pragma MARK scroll delegate
- (void)scrollBanner{
    if (_pageNumber >_imageArray.count-2) {
        _pageNumber = 0;
    }
self.pageControl.currentPage = _pageNumber;
 self.backScrollView.contentOffset = CGPointMake((self.pageControl.currentPage+1) *sWdith, 0);
    
  _pageNumber ++;
//    number ***
//    NSLog(@"self.pageControl.currentPage= %ld -- %ld",self.pageControl.currentPage,_imageArray.count-2);
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.bannnerTimer invalidate];
    _bannnerTimer = nil;
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"123");
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.scrollRight) {
        switch (_imageArray.count) {
            case 3:{
                [scrollView setContentOffset:CGPointMake(sWdith , 0) animated:NO];
            }
                break;
            default:{
                if (scrollView.contentOffset.x/sWdith > (_imageArray.count-2)) {
                    [scrollView setContentOffset:CGPointMake(sWdith, 0) animated:NO];
                }
                
            }
                break;
        }
    }else{
        switch (_imageArray.count) {
            case 3:{
                [scrollView setContentOffset:CGPointMake(sWdith , 0) animated:NO];
            }
                break;
            default:{
                if (scrollView.contentOffset.x/sWdith  < 1) {
                    [scrollView setContentOffset:CGPointMake(sWdith *(_imageArray.count-2), 0) animated:NO];
                }
                
            }
                break;
        }
    }
    
    _pageNumber = scrollView.contentOffset.x/sWdith -1;
    self.pageControl.currentPage = _pageNumber;
    //    NSLog(@"_pageNumber = %ld",_pageNumber);
    [self.bannnerTimer fire];
  
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    self.scrollRight =velocity.x > 0 ? YES:NO;
}

-(NSTimer *)bannnerTimer{
    if (!_bannnerTimer) {
      _bannnerTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(scrollBanner) userInfo:nil repeats:YES];
    }
    return _bannnerTimer;
}

-(void)removeFromSuperview{
    [super removeFromSuperview];
    [self.bannnerTimer invalidate];
    self.bannnerTimer = nil;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
