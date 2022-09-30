//
//  BaseCell.h
//  TMSDriver
//
//  Created by mac on 2019/1/22.
//  Copyright © 2019年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"

@interface BaseCell : UITableViewCell
+ (instancetype)cellCodeWithTableView:(UITableView *)tableView ForCellId:(NSString *)cellId;
+ (instancetype)cellXibWithTableView:(UITableView *)tableView ForCellId:(NSString *)cellId;

@end
