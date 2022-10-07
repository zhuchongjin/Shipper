//
//  XuanZeSiJiCell.m
//  Shipper
//
//  Created by admin on 2022/10/6.
//  Copyright © 2022 admin. All rights reserved.
//

#import "XuanZeSiJiCell.h"

@implementation XuanZeSiJiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)touchSelectAction{
    if (self.blcokSelelct) {
        self.blcokSelelct(@"");
    }
}
@end


