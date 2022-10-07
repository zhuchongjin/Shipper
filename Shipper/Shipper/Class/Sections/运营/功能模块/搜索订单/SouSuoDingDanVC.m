//
//  SouSuoDingDanVC.m
//  Shipper
//
//  Created by zcj on 2022/10/7.
//  Copyright © 2022 admin. All rights reserved.
//

#import "SouSuoDingDanVC.h"

@interface SouSuoDingDanVC ()

@end

@implementation SouSuoDingDanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"订单搜索"];
    [self setBackLeftButton:@""];
    
    [self creatView];
}

- (void)creatView{
    
    CGRect rcFrame = CGRectMake(0, kTopHeight, kScreenWidth, 0);
    FlexFrameView* header = [[FlexFrameView alloc]initWithFlex:@"SouSuoDingDanView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    
    [header layoutIfNeeded];
    
    [self.view addSubview:self.baseTableView];
    self.baseTableView.tableHeaderView = header;
    [self.baseTableView reloadData];
}

@end
