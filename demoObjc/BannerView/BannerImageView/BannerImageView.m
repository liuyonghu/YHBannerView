//
//  BannerImageView.m
//  境外易购
//
//  Created by victorLiu on 2017/11/14.
//  Copyright © 2017年 刘勇虎. All rights reserved.
//

#import "BannerImageView.h"
#import "WebVIewController.h"
#import "UIImageView+WebCache.h"
#import "YHBannerView.h"

@interface BannerImageView ()
@property(nonatomic,strong)UIViewController *target;
@property(nonatomic,strong)NSString *placeholderName;
@end
@implementation BannerImageView
-(instancetype)initWithFrame:(CGRect)frame withInfoData:(ImageInfoData *)data addTarget:(id)target withPlaceholder:(NSString *)placeholderName{
    _placeholderName = placeholderName;
    if (self == [super initWithFrame:frame] ) {
        NSAssert([data isKindOfClass:[ImageInfoData class]], @"data 必须为ImageInfoData实例对象！");
//        && [data isKindOfClass:[ImageInfoData class]]
        self.infoData = data;
        if (target != nil && [target isKindOfClass:[UIViewController class]]) {
            self.target = target;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openWebView)];
            self.userInteractionEnabled = YES;
            [self addGestureRecognizer:tap];
        }else{
            NSLog(@"initWithFrame:(CGRect)frame withInfoData:(ImageInfoData *)data addTarget:(id)target   入参target-为必填项  ");
        }
    
    }
    return self;
}

- (void)openWebView{
    WebVIewController *webViewController = [[WebVIewController alloc]init];
    webViewController.pageTitle = self.infoData.title;
    webViewController.PageUrlString = self.infoData.turnUrl;
    webViewController.hidesBottomBarWhenPushed = YES;
    [self.target.navigationController pushViewController:webViewController animated:YES];
}

-(void)setInfoData:(ImageInfoData *)infoData{
    if (_infoData != infoData) {
        _infoData = infoData;
    }

   [self sd_setImageWithURL:[NSURL URLWithString:_infoData.imgUrl] placeholderImage:[UIImage imageNamed:_placeholderName] options:SDWebImageRetryFailed];
   
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
