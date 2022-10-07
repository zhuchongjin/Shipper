//
//  QueRenQianShowVC.m
//  Shipper
//
//  Created by zcj on 2022/10/6.
//  Copyright © 2022 admin. All rights reserved.
//

#import "QueRenQianShowVC.h"
#import "QueRenQianShowView.h"

@interface QueRenQianShowVC ()
@property (nonatomic,strong) QueRenQianShowView *headerView;/**<  <#Description#> */


@end

@implementation QueRenQianShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"确认签收"];
    [self setBackLeftButton:@""];
    
    

    [self.view addSubview:self.headerView];
}


#pragma mark ----------lazy

- (QueRenQianShowView *)headerView{
    if(!_headerView){
        _headerView = [[QueRenQianShowView alloc] initWithFrame:CGRectMake(0, kTopHeight,kScreenWidth, 0)];
        _headerView.flexibleHeight = YES;
        
        [_headerView layoutIfNeeded];
    }
    return _headerView;;
}


@end
