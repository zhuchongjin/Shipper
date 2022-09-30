//
//  MineCell.m
//  Shipper
//
//  Created by mac on 2020/10/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "MineCell.h"
@interface MineCell()
@property (nonatomic,strong) UIImageView *imgVTitle;
@property (nonatomic,strong) UILabel *labTitle;
//@property (nonatomic,strong) UIImageView *imgVAouth;
//@property (nonatomic,strong) UILabel *labDetail;
@end
@implementation MineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellInfoimgVHeader:(NSString *)strImg cellTitle:(NSString *)strTitle index:(NSInteger )index isOnShowAouth:(BOOL)show{
    
    self.imgVTitle.image = UIImageNamed(strImg);
    if (index == 2) {
        self.imgVTitle.size = CGSizeMake(LW(14), LW(17));
    }else{
        self.imgVTitle.size = CGSizeMake(LW(17), LW(16.7));
    }
    self.labTitle.text = strTitle;
    // 认证状态
//    if (index == 0) {
//
//        if ([CJControl getIdCardDueWarn]) {
//            self.imgVAouth.hidden = NO;
//        }else{
//            self.imgVAouth.hidden = YES;
//        }
//    }else{
//        self.imgVAouth.hidden = YES;
//
//    }
    
//    // 展示授权
//    if (show) {
////        self.labDetail.hidden = NO;
//        self.labDetail.text = [CJControl getAccountBalanceVisafreeAuthStatus];
//    }else{
////        self.labDetail.hidden = YES;
//        self.labDetail.text = @"";
//
//    }
//    
////    self.imgVTitle.image = [self imageContentWithColor:[UIColor cjMainColor] withImga:self.imgVTitle.image];

}



- (UIImage *)imageContentWithColor:(UIColor *)color withImga:(UIImage *)image{
    if (!color) {
        return nil;
    }
    
    UIImage *newImage = nil;
    
    CGRect imageRect = (CGRect){CGPointZero,image.size};
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, image.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0.0, -(imageRect.size.height));
    
    CGContextClipToMask(context, imageRect, image.CGImage);//选中选区 获取不透明区域路径
    CGContextSetFillColorWithColor(context, color.CGColor);//设置颜色
    CGContextFillRect(context, imageRect);//绘制
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();//提取图片
    
    UIGraphicsEndImageContext();
    return newImage;
}


@end
