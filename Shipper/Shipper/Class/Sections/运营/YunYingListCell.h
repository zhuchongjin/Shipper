//
//  YunYingListCell.h
//  Shipper
//
//  Created by admin on 2022/10/4.
//  Copyright © 2022 admin. All rights reserved.
//

#import "BaseCell.h"

/**
 *   数据处理方式枚举
 */
typedef NS_ENUM(NSUInteger, ListBtnType) {

    /**
     *取消
     */
    ListQuXiao = 0,
    /**
     *修改
     */
    ListXiuGai,
    /**
     *异常上报
     */
    ListYiChang,
    /**
     *指派车辆
     */
    ListZhiPai,
    /**
     *一键签收
     */
    ListYiJianQianShou,
    /**
     *评价
     */
    ListPingJia,
    /**
     *确认签收
     */
    ListQueRenQianshou,
    /**
     *回单
     */
    ListHuiDan,
    /**
     *回单查看
     */
    ListHuiDanChaKan,
};

typedef void(^BlockListBtn)(ListBtnType type);

NS_ASSUME_NONNULL_BEGIN

@interface YunYingListCell : BaseCell

- (void)setCellInfoWithIndex:(NSInteger )index;

@property (copy, nonatomic) BlockListBtn blockTouch;/**<  <#Description#> */

@end

NS_ASSUME_NONNULL_END
