//
//  BaseCell.m
//  TMSDriver
//
//  Created by mac on 2019/1/22.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellCodeWithTableView:(UITableView *)tableView ForCellId:(NSString *)cellId
{
    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[BaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentMode = UITableViewCellAccessoryNone;
        cell.backgroundColor = [UIColor cjWhiteColor];
        
    }
    return cell;
}

+ (instancetype)cellXibWithTableView:(UITableView *)tableView ForCellId:(NSString *)cellId 
{
    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];

    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellId owner:nil options:nil] firstObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentMode = UITableViewCellAccessoryNone;
        cell.backgroundColor = [UIColor cjWhiteColor];

    }
    
    return cell;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
