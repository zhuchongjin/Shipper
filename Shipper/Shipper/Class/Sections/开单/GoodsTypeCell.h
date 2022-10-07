//
//  GoodsTypeCell.h
//  Shipper
//
//  Created by admin on 2022/10/2.
//  Copyright © 2022 admin. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface GoodsTypeCell : BaseCell

@property (nonatomic,copy) CJBlock blockAdd;/**<  <#Description#> */
@property (nonatomic,copy) CJBlock blockSelelctGoodsType;/**<  选择货物类型 */

- (void)setCellInfoWithIndex:(NSInteger )index;
@end

NS_ASSUME_NONNULL_END

