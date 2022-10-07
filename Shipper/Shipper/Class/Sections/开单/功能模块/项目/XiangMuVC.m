//
//  XiangMuVC.m
//  Shipper
//
//  Created by admin on 2022/10/2.
//  Copyright © 2022 admin. All rights reserved.
//

#import "XiangMuVC.h"
#import "XiangMuCell.h"
@interface XiangMuVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) CJTableView *tableView;

@end

@implementation XiangMuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"项目"];
    [self setBackLeftButton:@""];
    [self.view addSubview:self.tableView];
    [self createView];
}

- (void)createView{
    
    CGRect rcFrame = CGRectMake(0, 0, kScreenWidth, 0);
    FlexFrameView* header = [[FlexFrameView alloc]initWithFlex:@"SearchTopView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    [header layoutIfNeeded];
    
    self.tableView.tableHeaderView = header;
    [self.tableView reloadData];
}
#pragma mark ----------btnAction

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
    
    static NSString *identifier = @"XiangMuCell";
    XiangMuCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[XiangMuCell alloc] initWithFlex:nil reuseIdentifier:identifier];
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
