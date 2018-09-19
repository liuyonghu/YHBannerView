//
//  ImageInfoData.m
//  境外易购
//
//  Created by victorLiu on 2017/11/15.
//  Copyright © 2017年 刘勇虎. All rights reserved.
//

#import "ImageInfoData.h"

@implementation ImageInfoData

-(instancetype)initWithDictionary:(NSDictionary *)dicData{
    if (self == [super init]) {
        if ([dicData isKindOfClass:[NSDictionary class]]) {
            [self setValuesForKeysWithDictionary:dicData];
        }else{
            NSLog(@"入参有误！");
        }
        
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
 
}
@end
