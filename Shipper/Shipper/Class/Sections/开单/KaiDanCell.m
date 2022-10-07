//
//  KaiDanCell.m
//  Shipper
//
//  Created by admin on 2022/10/2.
//  Copyright © 2022 admin. All rights reserved.
//

#import "KaiDanCell.h"
@interface KaiDanCell()
@property (nonatomic,strong) UILabel *labName;
@end
@implementation KaiDanCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellInfoWithIndex:(NSInteger )index{
    
    self.labName.text = CJStringWithFormat(@"起运地%@",@(index).cj_desc);
}

- (void)touchViewAddAdress{
    if(self.blockAdd){
        self.blockAdd(@"");
    }
}

@end
