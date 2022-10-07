//
//  ZhiPaiCheLiangVC.m
//  Shipper
//
//  Created by admin on 2022/10/2.
//  Copyright © 2022 admin. All rights reserved.
//

#import "ZhiPaiCheLiangVC.h"
#import "XuanZeSiJiVC.h"
#import "XuanZeCheXingVC.h"

@interface ZhiPaiCheLiangVC ()

@end

@implementation ZhiPaiCheLiangVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"指派车辆"];
    [self setBackLeftButton:@""];
    [self.view addSubview:self.baseTableView];
    [self createView];
}

- (void)createView{
    
    CGRect rcFrame = CGRectMake(0, 0, kScreenWidth, 0);
    FlexFrameView* header = [[FlexFrameView alloc]initWithFlex:@"ZhiPaiCheLiangView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    
    
    [header layoutIfNeeded];
    self.baseTableView.tableHeaderView = header;
    self.baseTableView.frame = CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight-kTopHeight - kBottomSafeHeight);
    [self.baseTableView reloadData];
}
#pragma mark ----------btnAction

/// 选择司机
- (void)touchXuanZeSiJiAction{
    XuanZeSiJiVC *vc = [XuanZeSiJiVC new];
    [self pushVc:vc];
}

- (void)touchXuanZeCheXingAction{
//    ShowMessage(@"测试测试----");
    XuanZeCheXingVC *vc = [XuanZeCheXingVC new];
    [self pushVc:vc];
}
- (void)touchCheLiangLaiYuanAction{
    ShowMessage(@"测试测试----");
}

- (void)touchZhiPaiAction{
    ShowMessage(@"测试测试----");

}

@end



