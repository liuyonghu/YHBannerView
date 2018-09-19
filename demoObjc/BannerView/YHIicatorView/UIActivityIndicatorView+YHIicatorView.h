//
//  UIActivityIndicatorView+YHIicatorView.h
//  NewKroreaCards
//
//  Created by victorLiu on 2017/11/18.
//  Copyright © 2017年  刘勇虎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActivityIndicatorView (YHIicatorView)
+(UIActivityIndicatorView *)defaultActivityView;
+(void)showYHIndicatorViewWithTargetViewController:(UIViewController *)viewController;
+(void)hideYHIndicatorViewWithTargetViewController:(UIViewController *)viewController;
@end
