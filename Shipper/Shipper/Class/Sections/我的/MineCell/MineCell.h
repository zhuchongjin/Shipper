//
//  MineCell.h
//  Shipper
//
//  Created by mac on 2020/10/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "FlexBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineCell : FlexBaseTableCell
- (void)setCellInfoimgVHeader:(NSString *)strImg cellTitle:(NSString *)strTitle index:(NSInteger )index isOnShowAouth:(BOOL)show;
@end

NS_ASSUME_NONNULL_END
