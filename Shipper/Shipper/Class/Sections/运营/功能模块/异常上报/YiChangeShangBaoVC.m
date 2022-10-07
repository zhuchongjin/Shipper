//
//  YiChangeShangBaoVC.m
//  Shipper
//
//  Created by admin on 2022/10/4.
//  Copyright © 2022 admin. All rights reserved.
//

#import "YiChangeShangBaoVC.h"

@interface YiChangeShangBaoVC ()

@end

@implementation YiChangeShangBaoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"异常上报"];
    [self setBackLeftButton:@""];
    [self createView];
}

- (void)createView{
    
    CGRect rcFrame = CGRectMake(0, kTopHeight, kScreenWidth, 0);
    FlexFrameView* header = [[FlexFrameView alloc]initWithFlex:@"YiChangeShangBaoView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    
    [header layoutIfNeeded];
    [self.view addSubview:header];
    
}

@end
