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
@property (nonatomic,copy)NSArray *arrImgs;
@property (nonatomic,copy)NSArray *arrTitles;
@property (nonatomic,copy) NSDictionary *dicUserInfo;
//    ----
@property (nonatomic,strong) CJImageView *imgVheader;
@property (nonatomic,strong) CJLabel *labName;
@property (nonatomic,strong) CJLabel *labPhone;
@property (nonatomic,strong) UIView *viewPersonInfo;
@property (nonatomic,strong) CJLabel *labFinsihOrderNums; //已完运单数量
@property (nonatomic,strong) CJLabel *labUnfinsihOrderNums; //未完运单数量
@property (nonatomic,strong) MineCell *mineCell;
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
    [self getArrTitleAndContent];
    [self createTableViewHeader];
    [self setWhiterColorAppNavigationBarStyle];
    
    [self makeHeaderView];
//    WS(ws);
//    [CJNetWork getBrachcCodeSuccess:^(id  _Nullable responseObject) {
////        [ws makeHeaderView];
//        ws.footerView.labPhone.text = CJStringWithFormat(@"全国24小时服务热线 \n %@",[CJControl getString:responseObject[@"telephone"]]);
//    }];

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
    CGRect rcFrame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 0);
    if (!header) {
        header = [[FlexFrameView alloc] initWithFlex:@"MineHeaderView" Frame:rcFrame Owner:self];
    }
    
    header.flexibleHeight = YES;
    self.viewPersonInfo.backgroundColor = [[UIColor cjWhiteColor]colorWithAlphaComponent:0.16f];
    
    [header layoutIfNeeded];
    [self.view addSubview:header];
    
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

#pragma mark ----------点击事件
/// 头部点击事件
- (void)btnTouchViewMineHeaderAction{

 
}
/// 已完成运单数量
- (void)btnTouchFinsihOrderNumsAction{
    

}

/// 未完成运单
- (void)btnTouchUnfinshOrderNumsAction{
    
  
}


#pragma mark----tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"MineCell";
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MineCell alloc] initWithFlex:nil reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor cjClearColor];
    }

//    BOOL show;
//    if ([CJControl getShowAccountBalanceVisafree] && indexPath.row == self.arrTitles.count -2) {
//        cell.detailTextLabel.text = [CJControl getAccountBalanceVisafreeAuthStatus];
//        show = YES;
//    }else{
//        show = NO;
//    }
    
    [cell setCellInfoimgVHeader:self.arrImgs[indexPath.row] cellTitle:self.arrTitles[indexPath.row] index:indexPath.row isOnShowAouth:YES];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    


}


- (void)getArrTitleAndContent{
    
    _arrTitles = @[@"通知消息",@"意见反馈",@"关于我们"];//@"司机信息",
   _arrImgs = @[@"zcj_mine_msg",@"zcj_mine_feedback",@"zcj_mine_about_us"]; //@"zcj_mine_driver_info",
}

#pragma mark -- lazy ---

- (CJTableView *)tableView{
    if (!_tableView) {
        _tableView = CJTableView.tbInitFrameStyle(CGRectMake(0, header.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - kTabBarHeight  -tbToTopHeight - header.height),UITableViewStylePlain)
        .tbDelegate(self)
        .tbDataSource(self)
        .tbSetOther(YES)
        .tbEstimatedRowHeight(YES)
        .tbMjHeader(YES)
        ;
        _tableView.backgroundColor = [UIColor cjClearColor];
        WS(ws);
        _tableView.blockMjHeader = ^(BOOL isheader) {

            if (isheader) {
                [ws headerRereshing];
            } else {
                [ws.tableView.mj_footer endRefreshing];
                [ws.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        };
    }
    
    return _tableView;
}


@end
