//
//  KaiDanVC.m
//  Shipper
//
//  Created by admin on 2022/9/29.
//  Copyright © 2022 admin. All rights reserved.
//

#import "KaiDanVC.h"
#import "KaiDanCell.h"
#import "GoodsTypeCell.h"
#import "XiangMuVC.h"
#import "ChangFaKeHuVC.h"
#import "GoodsTypeVC.h"

@interface KaiDanVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) CJTableView *tableView;
@property (nonatomic,strong) NSMutableArray *listData;
@end

@implementation KaiDanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitleName:@"开单"];
    //    [self setBackLeftButton:@""];
    
    [self.view addSubview:self.tableView];
    [self createView];
}

- (void)createView{
    
    NSArray *arr1 = @[@"0",@""];
    NSArray *arr2 = @[@"00"];
    [self.listData addObject:arr1];
    [self.listData addObject:arr2];
    
    DLog(@"%@",self.listData);
    
    CGRect rcFrame = CGRectMake(0, 0, kScreenWidth, 0);
    FlexFrameView* header = [[FlexFrameView alloc]initWithFlex:@"KaiDanHeaderView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    [header layoutIfNeeded];
    
    self.tableView.tableHeaderView = header;
    

    FlexFrameView* footer = [[FlexFrameView alloc]initWithFlex:@"KaiDanFooterView" Frame:rcFrame Owner:self];
    footer.flexibleHeight = YES;
    [footer layoutIfNeeded];
    
    self.tableView.tableFooterView = footer;
    
    [self.tableView reloadData];
}
#pragma mark ----------btnAction

/// 项目信息
- (void)touchXiangMuInforAction{
//    ShowMessage(@"测试测试---");
    XiangMuVC *vc = [[XiangMuVC alloc]init];
    [self pushVc:vc];
}

- (void)touchKeHuXinXiAction{
    ChangFaKeHuVC *vc = [[ChangFaKeHuVC alloc]init];
    [self pushVc:vc];
}

/// 增加和删除cell
/// - Parameter indexP: <#indexP description#>
- (void)touchAddAdressInfo:(NSIndexPath *)indexP{
    
    NSArray *arr = self.listData[indexP.section];
    NSMutableArray *arrM = [arr mutableCopy];
    if (indexP.row == 0) {
        ShowMessage(@"测试测试 +++++");
        [arrM addObject:@""];
    } else {
        ShowMessage(@"测试测试 ------");
        [arrM removeObjectAtIndex:indexP.row];

    }
    [self.listData replaceObjectAtIndex:indexP.section withObject:arrM];
    [self.tableView reloadData];
}

- (void)createOrderAction{
    ShowMessage(@"创建订单");
}


#pragma mark ----------tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.listData[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        static NSString *identifier = @"KaiDanCell";
        KaiDanCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[KaiDanCell alloc] initWithFlex:nil reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setCellInfoWithIndex:indexPath.row];
        
        @weakify(self);
        cell.blockAdd = ^(id anyObject) {
            @strongify(self);
            [self touchAddAdressInfo:indexPath];
        };
        
        return cell;
    } else if (indexPath.section == 1) {
        static NSString *identifier = @"GoodsTypeCell";
        GoodsTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[GoodsTypeCell alloc] initWithFlex:nil reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setCellInfoWithIndex:indexPath.row];
        
        @weakify(self);
        cell.blockAdd = ^(id anyObject) {
            @strongify(self);
            [self touchAddAdressInfo:indexPath];
        };
        
        cell.blockSelelctGoodsType = ^(id anyObject) {
            @strongify(self);
            GoodsTypeVC *vc = [[GoodsTypeVC alloc]init];
            [self pushVc:vc];
        };
        
        return cell;
    }
    
    return nil;
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return [self getAddressTitleView].height;
    } else {
        return [self getGoodsTypeView].height;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return [self getAddressTitleView];
    } else {
        return [self getGoodsTypeView];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (FlexFrameView *)getAddressTitleView{
    
    CGRect rcFrame = CGRectMake(0, 0, kScreenWidth, 0);
    FlexFrameView* header = [[FlexFrameView alloc]initWithFlex:@"KiaDanAdressHeaderView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    [header layoutIfNeeded];
    return header;
}

- (FlexFrameView *)getGoodsTypeView{
    
    CGRect rcFrame = CGRectMake(0, 0, kScreenWidth, 0);
    FlexFrameView* header = [[FlexFrameView alloc]initWithFlex:@"KaiDanGoodsTypeHeaderView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    [header layoutIfNeeded];
    
    return header;
}

#pragma mark ----------lazy
- (CJTableView *)tableView{
    if (!_tableView) {
        _tableView = CJTableView.tbInitFrameStyle(CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight-kTopHeight -kBottomSafeHeight ),UITableViewStyleGrouped)
            .tbDelegate(self)
            .tbDataSource(self)
            .tbSetOther(YES)
            .tbEstimatedRowHeight(YES)
        ;
    }
    return _tableView;
}

- (NSMutableArray *)listData{
    if(!_listData){
        _listData = [[NSMutableArray alloc]init];
    }
    return _listData;
}

//- (void)initData{
//    self.modelArray = [[NSMutableArray alloc]init];
//    self.page = 1;
//}
//
///// <#Description#>
//- (void)loadData {
//
//    NSString *strURL = CJStringWithFormat(@"%@/ntocc-basic-api/partyGroup/queryListByParent",CJBaseURL);
//    NSDictionary *dicPar = @{@"pageNum":CJStringWithFormat(@"%d",self.page),
//                             @"pageSize":@"10",
//                             @"parentCode":[CJControl getBranchCode]
//    };
//
//    WS(ws);
//    [[HDNetworking sharedHDNetworking] GET:strURL parameters:dicPar success:^(id  _Nonnull responseObject) {
//
//        DLog(@"++++++++%@",responseObject);
//
//        NSArray *list = responseObject[@"records"];
//        NSString *total = CJStringWithFormat(@"%@",responseObject[@"total"]);
//        if (list.count > 0) {
//            //            #import "CommonRouteModel.h"
//            if ([ws.refreshType isEqualToString:@"down"]) {
//                [ws.modelArray removeAllObjects];
//            }
//
//            NSError * error ;
//            NSArray *arr = [InstitutionsTypeModel arrayOfModelsFromDictionaries:list error:&error];
//            [ws.modelArray addObjectsFromArray:arr];
//            [ws.tableView.mj_header endRefreshing];
//            [ws.tableView.mj_footer endRefreshing];
//
//            if (ws.modelArray.count == total.intValue) {
//                [ws.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
//
//        }else{
//
//            [ws.tableView.mj_header endRefreshing];
//            [ws.tableView.mj_footer endRefreshingWithNoMoreData];
//        }
//
//        [ws.tableView reloadData];
//
//    } failure:^(NSError * _Nonnull error) {
//        DLog(@"++++++++%@",error);
//
//    }];
//
//}


@end
