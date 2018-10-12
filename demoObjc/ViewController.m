//
//  ViewController.m
//  demoObjc
//
//  Created by liuyonghu on 2018/9/19.
//  Copyright © 2018年 liuyonghu. All rights reserved.
//

#define sWidth [UIScreen mainScreen].bounds.size.width
#define sHeight [UIScreen mainScreen].bounds.size.height


#import "ViewController.h"
#import "YHBannerView.h"
#import "ImageInfoData.h"
@interface ViewController ()
@property(nonatomic,strong)YHBannerView *bannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:3];
    for (NSInteger i = 0; i < 3; i ++) {
        ImageInfoData *data ;
        
        switch (i) {
            case 0:
                data = [[ImageInfoData alloc]initWithDictionary:@{@"turnUrl":@"",@"imgUrl":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537336289963&di=0312d33fddd7e4d99a9c0107455ddb00&imgtype=0&src=http%3A%2F%2Fdik.img.lgdsy.com%2Fpic%2F27%2F18226%2F5f9e8784414eda48_1680x1050.jpg",@"title":@""}];
                break;
            case 1:
                data = [[ImageInfoData alloc]initWithDictionary:@{@"turnUrl":@"",@"imgUrl":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537336376014&di=de296b32804b17007430e23c304b6b79&imgtype=0&src=http%3A%2F%2Fdik.img.lgdsy.com%2Fpic%2F121%2F84218%2Fce13f71546a3884c.jpg",@"title":@""}];
                break;
            default:
                data = [[ImageInfoData alloc]initWithDictionary:@{@"turnUrl":@"",@"imgUrl":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537336376014&di=6b15b2a2bfbd77cc2334a49d08e1a75f&imgtype=0&src=http%3A%2F%2Fdik.img.lgdsy.com%2Fpic%2F26%2F17949%2F2820d37242cd3ba5.jpg",@"title":@""}];
                
                break;
        }
        [imageArray addObject:data];
        
        
   
    }
//    imageArray = @[@"1",@"2"];
    _bannerView = [[YHBannerView alloc]initWithFrame:CGRectMake(0, 20,sWidth , 200) withTargetViewController:self andImageInfoArray:imageArray withPaceholder:@""];
    [self.view addSubview:_bannerView];
    // Do any additional setup after loading the view, typically from a nib.
    

    
}

- (void)sliderAction:(UISlider *)slider{
    NSLog(@"slider move %.2f",slider.value);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
