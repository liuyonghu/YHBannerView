//
//  WebVIewController.m
//  NewKroreaCards
//
//  Created by victorLiu on 2017/11/17.
//  Copyright © 2017年  刘勇虎. All rights reserved.
//

#import "WebVIewController.h"
#import "UIActivityIndicatorView+YHIicatorView.h"
//#import "UIAlertController+customAlertView.h"
#import <WebKit/WebKit.h>
@interface WebVIewController ()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong)WKWebView *wekView;
@end

@implementation WebVIewController
-(void)loadView{
    [super loadView];
    
    self.wekView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    if (self.PageUrlString) {
         [self.wekView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.PageUrlString]]];
    }
    if (self.fileUrl) {
         [self.wekView loadRequest:[NSURLRequest requestWithURL:self.fileUrl]];
    }
   
    if (!self.title) {
        self.title = self.pageTitle;
    }
    
    [self.view addSubview:_wekView];
    self.wekView.UIDelegate = self;
    self.wekView.navigationDelegate = self;
    
    
    self.navigationController.navigationBar.translucent = NO;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 45, 20)];
    [button setBackgroundImage:[UIImage imageNamed:@"leftBtnimage"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backToAccountPage:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
  

    [UIActivityIndicatorView showYHIndicatorViewWithTargetViewController:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark --page method --
- (void)backToAccountPage:(UIButton *)sender{
    [UIActivityIndicatorView hideYHIndicatorViewWithTargetViewController:self];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    
}
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
      [UIActivityIndicatorView hideYHIndicatorViewWithTargetViewController:self];
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
   
    [UIActivityIndicatorView hideYHIndicatorViewWithTargetViewController:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
