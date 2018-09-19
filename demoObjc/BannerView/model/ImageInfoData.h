//
//  ImageInfoData.h
//  境外易购
//
//  Created by victorLiu on 2017/11/15.
//  Copyright © 2017年 刘勇虎. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageInfoData : NSObject
@property(nonatomic,strong)NSString *turnUrl;
@property(nonatomic,strong)NSString *imgUrl;
@property(nonatomic,strong)NSString *title;
-(instancetype)initWithDictionary:(NSDictionary *)dicData;
@end
