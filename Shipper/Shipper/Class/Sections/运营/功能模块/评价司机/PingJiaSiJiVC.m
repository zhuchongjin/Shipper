//
//  PingJiaSiJiVC.m
//  Shipper
//
//  Created by admin on 2022/10/6.
//  Copyright © 2022 admin. All rights reserved.
//

#import "PingJiaSiJiVC.h"
#import "HCSStarRatingView.h"
#import "BottomButtonView.h"

@interface PingJiaSiJiVC ()
@property (nonatomic,strong) UIView *viewStar;
@property (nonatomic,strong) HCSStarRatingView *viewRate;
@property (nonatomic,strong) BottomButtonView *bottomBtnView;/**<  <#Description#> */



@end

@implementation PingJiaSiJiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"评价司机"];
    [self setBackLeftButton:@""];
//    [self setRightImage:@"异常上报" image:@""];

    [self createView];
    [self.viewStar addSubview:self.viewRate];
    [self.viewRate addTarget:self action:@selector(didChangeAbnormalValue:) forControlEvents:UIControlEventValueChanged];
}

- (void)createView{
    
    CGRect rcFrame = CGRectMake(0, kTopHeight, kScreenWidth, 0);
    FlexFrameView* header = [[FlexFrameView alloc]initWithFlex:@"PingJiaSiJiView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    
    [header layoutIfNeeded];
    [self.view addSubview:header];
    

    
//    CGRect rcFrame1 = CGRectMake(0, kScreenHeight - kBottomSafeHeight - 60, kScreenWidth, 0);
//    FlexFrameView* bottomView = [[FlexFrameView alloc]initWithFlex:@"BottomButtonView" Frame:rcFrame1 Owner:self];
//    bottomView.flexibleHeight = YES;
//
//    [bottomView layoutIfNeeded];
//    [self.view addSubview:bottomView];
    
    [self.view addSubview:self.bottomBtnView];
    
}

- (void)didChangeAbnormalValue:(HCSStarRatingView *)sender {
    NSLog(@"Changed Abnormal to %.1f", sender.value);
}

#pragma mark ----------btnAction

//- (void)RightTextClick:(UIButton *)sender{
//    ShowMessage(@"测试测试-----");
//}


/// 取消
- (void)touchCancleAction{
    
}

/// 确定
- (void)touchSureAction{
    
}
#pragma mark ----------lazy

- (HCSStarRatingView *)viewRate{
    if (!_viewRate) {
      _viewRate =   [[HCSStarRatingView alloc]initWithFrame:CGRectMake(0,0,110,30)];
        _viewRate.tintColor = [UIColor cjStarRateColor];
        _viewRate.starBorderColor = [UIColor cjClearColor];
        _viewRate.emptyStarColor = [UIColor cjEmptyStarRateColor];
        _viewRate.backgroundColor = [UIColor cjClearColor];
        _viewRate.enabled = YES;
        _viewRate.allowsHalfStars = YES;
        _viewRate.maximumValue = 5;
        _viewRate.minimumValue = 0;
    }
    return  _viewRate;
}

- (BottomButtonView *)bottomBtnView{
    if(!_bottomBtnView){
        _bottomBtnView = [[BottomButtonView alloc] initWithFrame:CGRectMake(0, kScreenHeight - kBottomSafeHeight - 60, kScreenWidth, 0)];
        _bottomBtnView.flexibleHeight = YES;
        [_bottomBtnView layoutIfNeeded];
        _bottomBtnView.blockRight = ^(id anyObject) {
            ShowMessage(@"测试测试--右侧");
        };
        _bottomBtnView.blockLeft = ^(id anyObject) {
            ShowMessage(@"测试测试--左侧");

        };
    }
    return _bottomBtnView;
}

@end

