//
//  QueRenQianShowView.m
//  Shipper
//
//  Created by zcj on 2022/10/6.
//  Copyright © 2022 admin. All rights reserved.
//

#import "QueRenQianShowView.h"
@interface QueRenQianShowView()
@property (nonatomic,strong) UILabel *labName;/**<  <#Description#> */


@end
@implementation QueRenQianShowView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.labName.text = @"989";
    }
    return self;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
