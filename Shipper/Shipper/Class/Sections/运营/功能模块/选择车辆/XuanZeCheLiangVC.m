//
//  XuanZeCheLiangVC.m
//  Shipper
//
//  Created by admin on 2022/10/2.
//  Copyright © 2022 admin. All rights reserved.
//

#import "XuanZeCheLiangVC.h"
#import "XuanZeCheLiangCell.h"
#import "SearchView.h"
@interface XuanZeCheLiangVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) CJTableView *tableView;
@property (nonatomic,strong) UITextField *tfSearch;
@property (nonatomic,strong) SearchView *searchView;/**<  <#Description#> */


@end

@implementation XuanZeCheLiangVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"选择车辆"];
    [self setBackLeftButton:@""];
    [self setRightImage:@"重置" image:@""];
    [self.view addSubview:self.tableView];
    [self createView];
}

- (void)createView{
    
//    CGRect rcFrame = CGRectMake(0, 0, kScreenWidth, 0);
//    FlexFrameView* header = [[FlexFrameView alloc]initWithFlex:@"SearchTopView" Frame:rcFrame Owner:self];
//    header.flexibleHeight = YES;
//    self.tfSearch.placeholder = @"请输入司机车牌号";
//
//    [header layoutIfNeeded];
    self.tableView.tableHeaderView = self.searchView;
    [self.tableView reloadData];
}
#pragma mark ----------btnAction

- (void)RightTextClick:(UIButton *)sender{
    ShowMessage(@"测试测试-----");
}
/// 搜索🔍
- (void)touchSouSuoInforAction{
    ShowMessage(@"测试测试---");
}

#pragma mark ----------tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"XuanZeCheLiangCell";
    XuanZeCheLiangCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[XuanZeCheLiangCell alloc] initWithFlex:nil reuseIdentifier:identifier];
        //        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyEvaluationCell" owner:nil options:nil] firstObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    @weakify(self);
    cell.blcokSelelct = ^(id anyObject) {
        @strongify(self);
        [self pop];
    };
    return cell;
}


#pragma mark ----------lazy
- (CJTableView *)tableView{
    if (!_tableView) {
        _tableView = CJTableView.tbInitFrameStyle(CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight-kTopHeight -kBottomSafeHeight ),UITableViewStylePlain)
            .tbDelegate(self)
            .tbDataSource(self)
            .tbSetOther(YES)
            .tbEstimatedRowHeight(YES)
        ;
    }
    return _tableView;
}

- (SearchView *)searchView{
    if(!_searchView){
        _searchView =[[SearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
        _searchView.flexibleHeight = YES;
        _searchView.placeholder = @"请输入司机车牌号";
        [_searchView layoutIfNeeded];
        @weakify(self);
        _searchView.blockSearch = ^(id anyObject) {
            @strongify(self);
            [self touchSouSuoInforAction];
        };
    }
    return _searchView;
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




