//
//  BannerImageView.h
//  境外易购
//
//  Created by victorLiu on 2017/11/14.
//  Copyright © 2017年 刘勇虎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageInfoData.h"
@interface BannerImageView : UIImageView
@property(nonatomic,strong)ImageInfoData *infoData;
-(instancetype)initWithFrame:(CGRect)frame withInfoData:(ImageInfoData *)data addTarget:(id)target withPlaceholder:(NSString *)placeholderName;
@end
