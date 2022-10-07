//
//  KaiDanCell.h
//  Shipper
//
//  Created by admin on 2022/10/2.
//  Copyright © 2022 admin. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface KaiDanCell : BaseCell

@property (nonatomic,copy) CJBlock blockAdd;/**<  <#Description#> */

- (void)setCellInfoWithIndex:(NSInteger )index;
@end

NS_ASSUME_NONNULL_END
