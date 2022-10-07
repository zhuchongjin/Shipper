//
//  HuiDanChaKanVC.m
//  Shipper
//
//  Created by zcj on 2022/10/7.
//  Copyright © 2022 admin. All rights reserved.
//

#import "HuiDanChaKanVC.h"
#import "UpLoadImageView.h"

@interface HuiDanChaKanVC ()
@property (nonatomic,strong) UpLoadImageView *upLoadImgView;/**<  <#Description#> */


@end

@implementation HuiDanChaKanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"回单查看"];
    [self setBackLeftButton:@""];
    
    self.upLoadImgView.listImgUrl = @[@"https://uploadfile.huiyi8.com/2015/0309/20150309021225406.jpg",@"https://uploadfile.huiyi8.com/2015/0309/20150309021225406.jpg",@"https://uploadfile.huiyi8.com/2015/0309/20150309021225406.jpg",@"https://uploadfile.huiyi8.com/2015/0309/20150309021225406.jpg"];
    [self.view addSubview:self.upLoadImgView];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



- (UpLoadImageView *)upLoadImgView{
    if(!_upLoadImgView){
        _upLoadImgView = [[UpLoadImageView alloc]initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, 0)];
        _upLoadImgView.flexibleHeight = YES;
        [_upLoadImgView layoutIfNeeded];
        _upLoadImgView.setDefaultHeigt = YES;
        _upLoadImgView.setShowImg = YES;
    }
    
    return _upLoadImgView;
}
@end
