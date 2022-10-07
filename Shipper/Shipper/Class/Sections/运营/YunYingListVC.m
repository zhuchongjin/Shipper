//
//  YunYingListVC.m
//  Shipper
//
//  Created by admin on 2022/10/4.
//  Copyright © 2022 admin. All rights reserved.
//

#import "YunYingListVC.h"
#import "YunYingListCell.h"
#import "YunYingListModel.h"
#import "YiChangeShangBaoVC.h"
#import "YiJianQianShouVC.h"
#import "ZhiPaiCheLiangVC.h"
#import "YiJianQianShouVC.h"
#import "PingJiaSiJiVC.h"
#import "QueRenQianShowVC.h"
#import "SouSuoDingDanVC.h"
#import "XuanZeCheLiangVC.h"
#import "HuiDanShangChuanVC.h"
#import "HuiDanChaKanVC.h"

@interface YunYingListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) CJTableView *tableView;
@property (nonatomic,strong) FlexFrameView* header;/**<  <#Description#> */

@property (nonatomic,strong) UITextField *tfSearch;/**<  <#Description#> */


@end

@implementation YunYingListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self createView];
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    DLog(@"=== %@",self.strTitle);
}

- (void)createView{
    
    CGRect rcFrame = CGRectMake(0, 0, kScreenWidth, 0);
    self.header = [[FlexFrameView alloc]initWithFlex:@"SearchTopView" Frame:rcFrame Owner:self];
    self.header.flexibleHeight = YES;
    self.tfSearch.placeholder = @"搜索订单";
    
    [self.header layoutIfNeeded];
    [self.view addSubview:self.header];
}

- (void)loadData{
    
    if ([self.strTitle isEqualToString:@"全部"]) {
        
    }else if ([self.strTitle isEqualToString:@"紧急单"]) {
        
    }else if ([self.strTitle isEqualToString:@"待指派"]) {
        
    }else if ([self.strTitle isEqualToString:@"在途中"]) {
        
    }else if ([self.strTitle isEqualToString:@"待确认"]) {
        
    }else if ([self.strTitle isEqualToString:@"已完成"]) {
        
    }else if ([self.strTitle isEqualToString:@"已取消"]) {
        
    }
    
}

#pragma mark ----------tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"YunYingListCell";
    YunYingListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[YunYingListCell alloc] initWithFlex:nil reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    @weakify(self);
    cell.blockTouch = ^(ListBtnType type) {
        @strongify(self);
        [self btnTouchAtIndex:indexPath type:type];
    };
    [cell setCellInfoWithIndex:indexPath.row];
    return cell;
}


- (void)btnTouchAtIndex:(NSIndexPath *)indexP type:(ListBtnType )type{
    
    YunYingListModel *model = [YunYingListModel new];
    switch (type) {
        case ListQuXiao:
//            ShowMessage(@"取消");
            [self pushVc:[XuanZeCheLiangVC new]];
            break;
        case ListXiuGai:
            ShowMessage(@"修改");
            break;
        case ListYiChang:
            [self touchYiChangbyMod:model];
            break;
        case ListZhiPai:
            [self touchZhiPaiCheLiangByMod:model];
            break;
        case ListYiJianQianShou:
            [self touchYiJianQianShouByMod:model];
            break;
        case ListPingJia:
            [self touchPingJiaSiJiByModd:model];
            break;
        case ListQueRenQianshou:
            [self touchQueRenQianShouByMod:model];
            break;
        case ListHuiDan:
            [self touchHuiDanShangChuanByMod:model];
            break;
        case ListHuiDanChaKan:
            [self pushVc:[HuiDanChaKanVC new]];
            break;
            
        default:
            break;
    }
}


#pragma mark ----------btnAction

/// 搜索🔍
- (void)touchSouSuoInforAction{
//    ShowMessage(@"测试测试---");
    SouSuoDingDanVC *vc = [SouSuoDingDanVC new];
    [self pushVc:vc];
}


/// 异常
/// - Parameters:
///   - model: <#model description#>
///   - type: <#type description#>
- (void)touchYiChangbyMod:(YunYingListModel *)model{
    YiChangeShangBaoVC *vc = [[YiChangeShangBaoVC alloc]init];
    [self pushVc:vc];
}

/// 指派车辆
/// - Parameter model: <#model description#>
- (void)touchZhiPaiCheLiangByMod:(YunYingListModel *)model{
    ZhiPaiCheLiangVC *vc = [[ZhiPaiCheLiangVC alloc]init];
    [self pushVc:vc];
}

/// 一键签收
/// - Parameter model: <#model description#>
- (void)touchYiJianQianShouByMod:(YunYingListModel *)model{
    YiJianQianShouVC *vc = [YiJianQianShouVC new];
    [self pushVc:vc];
}

- (void)touchPingJiaSiJiByModd:(YunYingListModel *)model{
    PingJiaSiJiVC *vc = [PingJiaSiJiVC new];
    [self pushVc:vc];
}

- (void)touchQueRenQianShouByMod:(YunYingListModel *)model{
    QueRenQianShowVC *vc = [[QueRenQianShowVC alloc]init];
    [self pushVc:vc];
}

- (void)touchHuiDanShangChuanByMod:(YunYingListModel *)model{
    HuiDanShangChuanVC *vc = [HuiDanShangChuanVC new];
    [self pushVc:vc];
}
#pragma mark ----------lazy

- (CJTableView *)tableView{
    if (!_tableView) {
        _tableView = CJTableView.tbInitFrameStyle(CGRectMake(0, self.header.bottom, kScreenWidth, kScreenHeight-kTopHeight - kTabBarHeight -self.header.height),UITableViewStylePlain)
            .tbDelegate(self)
            .tbDataSource(self)
            .tbSetOther(YES)
            .tbEstimatedRowHeight(YES)
        ;
    }
    return _tableView;
}

- (void)pushVc:(UIViewController *)vc {

    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    if (vc.hidesBottomBarWhenPushed == NO) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
