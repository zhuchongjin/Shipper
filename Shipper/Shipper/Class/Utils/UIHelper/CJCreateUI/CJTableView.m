//
//  CJTableView.m
//  TMSDriver
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "CJTableView.h"

@implementation CJTableView

+ (CJTableView *(^)(CGRect rect, UITableViewStyle style))tbInitFrameStyle{
    
    return ^(CGRect rect, UITableViewStyle style){
        
        
        return [[CJTableView alloc] initWithFrame:rect style:style];
    };
}

- (CJTableView *(^)(id <UITableViewDelegate>))tbDelegate{
    return ^(id <UITableViewDelegate> tbDelegate) {
        self.delegate = tbDelegate;
        return self;
    };
}

- (CJTableView *(^)(id <UITableViewDataSource>))tbDataSource{
    return ^(id <UITableViewDataSource> tbDataSource) {
        self.dataSource = tbDataSource;
        return self;
    };
}

- (CJTableView *(^)(BOOL isSetOther))tbSetOther{
    return ^(BOOL isSetOther){
        //[UIDevice currentDevice].systemVersion
        if (isSetOther) {
//            if (@available(iOS 11.0, *)) {
//                self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//            } else {
//                // Fallback on earlier versions
//            }
//            self.backgroundColor = [UIColor cjBackgroundColor];
//            self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//            [self setSeparatorInset:UIEdgeInsetsMake(0,15,0,15)];
//            if ([UIDevice currentDevice].systemVersion.doubleValue >= 11.0) {
//                self.estimatedRowHeight = 0;
//                self.estimatedSectionHeaderHeight = 0;
//                self.estimatedSectionFooterHeight = 0;
//            }
//            [self setSeparatorColor:[UIColor cjBackgroundColor]];
//            self.contentInset = UIEdgeInsetsMake(0, 0, 85+SafeAreaBottomHeight, 0);
//            self.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 85+SafeAreaBottomHeight, 0);
////            self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
            
            self.showsVerticalScrollIndicator = NO;
            if (@available(iOS 11.0, *)) {
                self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            } else {
                // Fallback on earlier versions
            }
            self.backgroundColor = [UIColor cjBackgroundColor];
            self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            [self setSeparatorInset:UIEdgeInsetsMake(0,15,0,15)];
            if (DeviceSystemVersion.doubleValue >= 11.0) {
                self.estimatedRowHeight = 0;
                self.estimatedSectionHeaderHeight = 0;
                self.estimatedSectionFooterHeight = 0;
            }
            [self setSeparatorColor:[UIColor cjBackgroundColor]];
            self.contentInset = UIEdgeInsetsMake(0, 0, 85+SafeAreaBottomHeight, 0);
            self.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 85+SafeAreaBottomHeight, 0);
            self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
            
            
        }
        return self;
    };
}

/**
 是否预估高度
 */
- (CJTableView *(^)(BOOL estimated))tbEstimatedRowHeight{
    
    return ^(BOOL estimated){
        if (estimated) {
            self.rowHeight = UITableViewAutomaticDimension;
            self.estimatedRowHeight = 150;
        }
        return self;
    };
}

- (CJTableView *(^)(BOOL mjHeadFooter))tbMjHeadFooter{
    
    return ^(BOOL mjHeadFooter){
        
        if (mjHeadFooter) {
            //创建一个下拉刷新的头
            WS(ws);
            MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                //       下拉刷新
                //            [self downRefresh];
                DLog(@"++++++++++");
                
                if (ws.blockMjHeader) {
                    ws.blockMjHeader(YES);
                }
            }];
            [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
            [header setTitle:@"松开我就刷新" forState:MJRefreshStatePulling];
            [header setTitle:@"刷新数据中..." forState:MJRefreshStateRefreshing];
            header.stateLabel.textColor = [UIColor cjSubheadTextColor];
            self.mj_header = header;
            
            MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                //            [self upRefresh];
                if (ws.blockMjHeader) {
                    ws.blockMjHeader(NO);
                }
                
                
            }];
            [footer setTitle:@"上拉刷新" forState:MJRefreshStateIdle];
            [footer setTitle:@"松开刷新" forState:MJRefreshStatePulling];
            [footer setTitle:@"刷新数据中..." forState:MJRefreshStateRefreshing];
            [footer setTitle:@"没有更多数据了" forState:MJRefreshStateNoMoreData];
            footer.stateLabel.textColor = [UIColor cjSubheadTextColor];
            footer.stateLabel.font = [UIFont cjTitleFont12];


            self.mj_footer = footer;
        }
        return self;
    };
}


- (CJTableView *(^)(BOOL mjHeader))tbMjHeader{
    
    return ^(BOOL mjHeader){
        
        if (mjHeader) {
            //创建一个下拉刷新的头
            WS(ws);
            MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                //       下拉刷新
                //            [self downRefresh];
                DLog(@"++++++++++");
                
                if (ws.blockMjHeader) {
                    ws.blockMjHeader(YES);
                }
            }];
            [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
            [header setTitle:@"松开我就刷新" forState:MJRefreshStatePulling];
            [header setTitle:@"刷新数据中..." forState:MJRefreshStateRefreshing];
            header.stateLabel.textColor = [UIColor cjSubheadTextColor];
            self.mj_header = header;
            
//            MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//                //            [self upRefresh];
//                if (ws.blockMjHeader) {
//                    ws.blockMjHeader(NO);
//                }
//
//
//            }];
//            [footer setTitle:@"上拉刷新" forState:MJRefreshStateIdle];
//            [footer setTitle:@"松开刷新" forState:MJRefreshStatePulling];
//            [footer setTitle:@"刷新数据中..." forState:MJRefreshStateRefreshing];
//            [footer setTitle:@"／︿＼没有更多数据了" forState:MJRefreshStateNoMoreData];
//            footer.stateLabel.textColor = [UIColor cjSubheadTextColor];
//            footer.stateLabel.font = [UIFont cjTitleFont12];
//
//
//            self.mj_footer = footer;
        }
        return self;
    };
}

@end
