//
//  YunYingListCell.m
//  Shipper
//
//  Created by admin on 2022/10/4.
//  Copyright © 2022 admin. All rights reserved.
//

#import "YunYingListCell.h"

@interface YunYingListCell()
@property (nonatomic,strong) UILabel *labName;

@property (nonatomic,strong) FlexTouchView *touchQuXiao;/**<  取消 */
@property (nonatomic,strong) FlexTouchView *touchXiuGai;/**<  订单修改 */
@property (nonatomic,strong) FlexTouchView *touchYiChang;/**<  异常上报 */
@property (nonatomic,strong) FlexTouchView *touchZhiPai;/**<  指派车辆 */
@property (nonatomic,strong) FlexTouchView *touchYiJianQianShou;/**<  一键签收 */
@property (nonatomic,strong) FlexTouchView *touchPingJia;/**<  评价 */
@property (nonatomic,strong) FlexTouchView *touchQueRenQianshou;/**<  确认签收 */
@property (nonatomic,strong) FlexTouchView *touchHuiDan;/**<  回单 */
@property (nonatomic,strong) FlexTouchView *touchHuiDanChaKan;/**<  回单查看 */

@end

@implementation YunYingListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



- (void)setCellInfoWithIndex:(NSInteger )index{
    
    self.labName.text = CJStringWithFormat(@"配送中%@",@(index).cj_desc);
}

#pragma mark ----------action
/// 取消
- (void)touchQuXiaoAction{
    if(self.blockTouch){
        self.blockTouch(ListQuXiao);
    }
}

/// 修改
- (void)touchXiuGaiAction{
    if(self.blockTouch){
        self.blockTouch(ListXiuGai);
    }
}

/// 异常
- (void)touchYiChangAction{
    if(self.blockTouch){
        self.blockTouch(ListYiChang);
    }
}

/// 指派
- (void)touchZhiPaiAction{
    if(self.blockTouch){
        self.blockTouch(ListZhiPai);
    }
}

/// 一键签收
- (void)touchYiJianQianShouAction{
    if(self.blockTouch){
        self.blockTouch(ListYiJianQianShou);
    }
}

/// 评价
- (void)touchPingJiaAction{
    if(self.blockTouch){
        self.blockTouch(ListPingJia);
    }
}

/// 确认签收
- (void)touchQueRenQianshouAction{
    if(self.blockTouch){
        self.blockTouch(ListQueRenQianshou);
    }
}

/// 回单
- (void)touchHuiDanAction{
    if(self.blockTouch){
        self.blockTouch(ListHuiDan);
    }
}

/// 回单查看
- (void)touchHuiDanChaKanAction{
    if(self.blockTouch){
        self.blockTouch(ListHuiDanChaKan);
    }
}
@end
