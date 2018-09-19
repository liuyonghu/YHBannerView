//
//  UIColor+GetRGBWithHexadecimalColor.m
//  ColorExchange
//
//  Created by victorLiu on 2017/6/22.
//  Copyright © 2017年  刘勇虎. All rights reserved.
//

#import "UIColor+GetRGBWithHexadecimalColor.h"

@implementation UIColor (GetRGBWithHexadecimalColor)
+ (UIColor *)getRGBWithHexadecimalColor:(NSString *)stringValue{
    
    
    //    判断是否符合
    if ([stringValue hasPrefix:@"#"]) {
        stringValue = [stringValue substringFromIndex:1];
    }
    
    
    if ([stringValue hasPrefix:@"0X"] || [stringValue hasPrefix:@"0x"]) {
        stringValue = [stringValue substringFromIndex:2];
    }
    if ([stringValue hasPrefix:@"FF"] || [stringValue hasPrefix:@"ff"]) {
        stringValue = [stringValue substringFromIndex:2];
    }
    
    //    定义接受参数
    
    unsigned int redPrameter = 0;
    unsigned int greenPramenter = 0;
    unsigned int bluePrameter = 0;
    
    if (stringValue.length == 6) {
        for (NSInteger i = 0; i < 3; i++) {
            switch (i) {
                case 0:
                {
                    NSString *temString = [stringValue substringWithRange:NSMakeRange(i*2, 2)];
                    [[NSScanner scannerWithString:temString] scanHexInt:&redPrameter];
                    
                }
                    break;
                case 1:
                {
                    NSString *temString = [stringValue substringWithRange:NSMakeRange(i*2, 2)];
                    [[NSScanner scannerWithString:temString] scanHexInt:&greenPramenter];
                }
                    break;
                    
                default:
                {
                    NSString *temString = [stringValue substringWithRange:NSMakeRange(i*2, 2)];
                    [[NSScanner scannerWithString:temString] scanHexInt:&bluePrameter];
                }
                    break;
            }    }
        
    }
    else{
        NSLog(@"参数长度有误");
    }
    
    
//    NSLog(@"stringValue = %d    = %d    = %d",redPrameter,greenPramenter,bluePrameter);
    
    UIColor *detainColor  = [UIColor colorWithRed:redPrameter/255.0f green:greenPramenter/255.0f blue:bluePrameter/255.0f alpha:1.0f];
    
    
    return detainColor;
}
@end
