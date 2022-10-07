//
//  YiJianQianShouVC.m
//  Shipper
//
//  Created by admin on 2022/10/6.
//  Copyright © 2022 admin. All rights reserved.
//

#import "YiJianQianShouVC.h"
#import "BottomButtonView.h"
@interface YiJianQianShouVC ()
@property (nonatomic,strong) BottomButtonView *bottomBtnView;/**<  <#Description#> */


@end

@implementation YiJianQianShouVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"一键签收"];
    [self setBackLeftButton:@""];
    [self setRightImage:@"异常上报" image:@""];

    [self createView];
}

- (void)createView{
    
    CGRect rcFrame = CGRectMake(0, kTopHeight, kScreenWidth, 0);
    FlexFrameView* header = [[FlexFrameView alloc]initWithFlex:@"YiJianQianShouView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    
    [header layoutIfNeeded];
    [self.view addSubview:header];
    
    
    [self.view addSubview:self.bottomBtnView];
    
}

#pragma mark ----------btnAction

- (void)RightTextClick:(UIButton *)sender{
    ShowMessage(@"测试测试-----");
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
