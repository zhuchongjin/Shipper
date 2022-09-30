//
//  CJTableView.h
//  TMSDriver
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ZCJBlock)(BOOL isheader);
@interface CJTableView : UITableView


+ (CJTableView *(^)(CGRect rect, UITableViewStyle style))tbInitFrameStyle;

- (CJTableView *(^)(id <UITableViewDelegate>))tbDelegate;

- (CJTableView *(^)(id <UITableViewDataSource>))tbDataSource;


/**typedef void(^CJBlock)(id anyObject);
 设置样式等部分 
 */
- (CJTableView *(^)(BOOL isSetOther))tbSetOther;

/**
 是否预估高度
 */
- (CJTableView *(^)(BOOL estimated))tbEstimatedRowHeight;

// 
@property (nonatomic,copy) ZCJBlock blockMjHeader;

/// 上拉下拉刷新
- (CJTableView *(^)(BOOL mjHeadFooter))tbMjHeadFooter;

/// 下拉刷新
- (CJTableView *(^)(BOOL mjHeader))tbMjHeader;

@end

NS_ASSUME_NONNULL_END
