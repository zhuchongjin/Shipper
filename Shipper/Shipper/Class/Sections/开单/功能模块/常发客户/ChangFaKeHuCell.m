//
//  ChangFaKeHuCell.m
//  Shipper
//
//  Created by admin on 2022/10/3.
//  Copyright © 2022 admin. All rights reserved.
//

#import "ChangFaKeHuCell.h"

@implementation ChangFaKeHuCell

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
