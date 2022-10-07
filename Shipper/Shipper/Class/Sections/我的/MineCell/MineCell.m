//
//  MineCell.m
//  Shipper
//
//  Created by mac on 2020/10/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "MineCell.h"
@interface MineCell()
@property (nonatomic,strong) UILabel *labTitle;
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

- (void)setCellTitle:(NSString *)strTitle{
    self.labTitle.text = strTitle;
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
