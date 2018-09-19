//
//  YHBannerView.h
//  境外易购
//
//  Created by victorLiu on 2017/11/14.
//  Copyright © 2017年 刘勇虎. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageInfoData;
@interface YHBannerView : UIView
@property(nonatomic,strong)id target;
- (instancetype)initWithFrame:(CGRect)frame withTargetViewController:(UIViewController *)targetViewController andImageInfoArray:(NSArray*)imageInfoArray withPaceholder:(NSString *)placeholder;
@property(nonatomic,strong)NSTimer *bannnerTimer;

@end
