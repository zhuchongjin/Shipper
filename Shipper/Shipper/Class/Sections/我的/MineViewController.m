//
//  MineViewController.m
//  TMSDriver
//
//  Created by mac on 2019/6/13.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "MineViewController.h"
#import "LogInVC.h"
#import "MineCell.h"
#import "UIImage+HDExtension.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>{
    FlexFrameView *header;
}
@property (strong, nonatomic) CJTableView *tableView;
@property (nonatomic,strong)NSMutableArray *listData;
//    ----
@property (nonatomic,strong) CJImageView *imgVheader;
@property (nonatomic,strong) CJLabel *labName;
@property (nonatomic,strong) CJLabel *labPhone;
@property (nonatomic,strong) UIView *viewPersonInfo;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"我的"];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
//    self.image.hidden = YES;
    [self createTableViewHeader];
    [self setWhiterColorAppNavigationBarStyle];
    
    [self makeHeaderView];
}

- (void)getUSerInfo{
        
}

// 下拉刷新
- (void)headerRereshing{
    [self makeHeaderView];
}

- (void)makeHeaderView{
    
    self.labName.text = @"登录 / 注册";
    self.labPhone.text = @"";
    [self.tableView.mj_header endRefreshing];
  
}

- (void)createTableViewHeader{
    //    WS(ws);
    CGRect rcFrame = CGRectMake(0, 0, kScreenWidth, 0);
    if (!header) {
        header = [[FlexFrameView alloc] initWithFlex:@"MineHeaderView" Frame:rcFrame Owner:self];
    }
    header.flexibleHeight = YES;
    self.viewPersonInfo.backgroundColor = [[UIColor cjWhiteColor]colorWithAlphaComponent:0.16f];
    
    [header layoutIfNeeded];
    [self.view addSubview:header];
    

    FlexFrameView *tableHeader = [[FlexFrameView alloc] initWithFlex:@"MineTableHeaderView" Frame:rcFrame Owner:self];
    tableHeader.flexibleHeight = YES;

    [tableHeader layoutIfNeeded];
    self.tableView.tableHeaderView = tableHeader;
    
    
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

#pragma mark ----------点击事件
/// 头部点击事件
- (void)btnTouchViewMineHeaderAction{

}


#pragma mark----tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"MineCell";
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MineCell alloc] initWithFlex:nil reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor cjClearColor];
    }

    [cell setCellTitle:self.listData[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



#pragma mark -- lazy ---

- (CJTableView *)tableView{
    if (!_tableView) {
        _tableView = CJTableView.tbInitFrameStyle(CGRectMake(0, header.bottom, kScreenWidth, kScreenHeight - kTabBarHeight  -tbToTopHeight - header.height),UITableViewStylePlain)
        .tbDelegate(self)
        .tbDataSource(self)
        .tbSetOther(YES)
        .tbEstimatedRowHeight(YES)
        .tbMjHeader(YES)
        ;
        _tableView.backgroundColor = [UIColor cjClearColor];
        @weakify(self);
        _tableView.blockMjHeader = ^(BOOL isheader) {
            @strongify(self);
            if (isheader) {
                [self headerRereshing];
            } else {
                [self.tableView.mj_footer endRefreshing];
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        };
    }
    
    return _tableView;
}

- (NSMutableArray *)listData{
    if(!_listData){
        _listData = [[NSMutableArray alloc]initWithArray:@[@"消息中心",@"设置"]];
    }
    return _listData;
}
@end
