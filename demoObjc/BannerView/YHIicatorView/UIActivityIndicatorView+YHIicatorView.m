//
//  UIActivityIndicatorView+YHIicatorView.m
//  NewKroreaCards
//
//  Created by victorLiu on 2017/11/18.
//  Copyright © 2017年  刘勇虎. All rights reserved.
//

#define sWidth               [UIScreen mainScreen].bounds.size.width
#define sHeight              [UIScreen mainScreen].bounds.size.height

#import "UIActivityIndicatorView+YHIicatorView.h"
#import "UIColor+GetRGBWithHexadecimalColor.h"


@implementation UIActivityIndicatorView (YHIicatorView)
+(UIActivityIndicatorView *)defaultActivityView{
    static  UIActivityIndicatorView *defaultActivty;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultActivty = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        defaultActivty.backgroundColor = [UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:0.6];
        [defaultActivty setFrame:CGRectMake(0, 0, sWidth/4, sWidth/4)];
        defaultActivty.layer.masksToBounds = YES;
        defaultActivty.layer.cornerRadius = 4;
    });
    return defaultActivty;
}

+(void)showYHIndicatorViewWithTargetViewController:(UIViewController *)viewController{
    if (![viewController.view.subviews containsObject: [UIActivityIndicatorView defaultActivityView]] ) {
        [UIActivityIndicatorView defaultActivityView].center = CGPointMake(sWidth/2, sHeight/2.5);
        [viewController.view addSubview:[UIActivityIndicatorView defaultActivityView]];
        [[UIActivityIndicatorView defaultActivityView] startAnimating];
    }
}
+(void)hideYHIndicatorViewWithTargetViewController:(UIViewController *)viewController{
    if ([viewController.view.subviews containsObject: [UIActivityIndicatorView defaultActivityView]] ) {
        [[UIActivityIndicatorView defaultActivityView] stopAnimating];
        [[UIActivityIndicatorView defaultActivityView] removeFromSuperview];
    }
    
}
@end
