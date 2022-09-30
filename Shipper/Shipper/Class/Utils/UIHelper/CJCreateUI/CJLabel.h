//
//  CJLabel.h
//  ControlFactory
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019年 zcj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef  NS_ENUM(NSUInteger, CJLabelRectCorner){
    
    /**
     *  全切
     */
    CJLabelRectCornerAll = 0,
    /**
     *  左上
     */
    CJLabelRectCornerLeftTop,
    /**
     *   左下
     */
    CJLabelRectCornerLeftBottom,
    /**
     *  左上左下
     */
    CJLabelRectCornerLeftTopBottom,
    /**
     *  右上
     */
    CJLabelRectCornerRightTop,
    /**
     *  右下
     */
    CJLabelRectCornerRightBottom,
    /**
     *  右上 右下
     */
    CJLabelRectCornerRightTopBottom,
};
@interface CJLabel : UILabel

+ (CJLabel *)labInit;

- (CJLabel *(^)(CGRect frame))labFrame;

/**
  CJLabel 字体文本
 */
- (CJLabel *(^)(NSString *text))labText;
/**
 CJLabel 字体大小
 */
- (CJLabel *(^)(UIFont *font))labFont;
- (CJLabel *(^)(CGFloat size))labFontSize;


- (CJLabel *(^)(UIColor *color))labTextColor;

- (CJLabel *(^)(BOOL hidden))labHidden;

- (CJLabel *(^)(NSTextAlignment aligment))labAlignment;

- (CJLabel *(^)(UIColor *color))labBgColor;

- (CJLabel *(^)(CGFloat radius))labCornerRadius;

- (CJLabel *(^)(CGFloat borderWidth))labBorderWidth;

- (CJLabel *(^)(UIColor *color))labBorderColor;

- (CJLabel *(^)(NSInteger numberLines))labNumLines;

- (CJLabel *(^)(BOOL adjustToFit))labAdjustsFontSizeToFitWidth;

- (CJLabel *(^)(NSLineBreakMode lineBreakMode))labLineBreakMode;

/**
 切圆角
 */
- (CJLabel *(^)(CJLabelRectCorner labCorner ,CGFloat radius ))labRectCornerRadius;

// 以下是3个
- (CJLabel *(^)(UIFont* antherFont))labAntherFont;

- (CJLabel *(^)(UIColor *anotherColor))labAnotherColor;

- (CJLabel *(^)(NSString *text))labAnotherTest;

#pragma mark ----------设置富文本
/**
 *  Set a highlight color to show emphasis between the beginmark and endmark
 *
 *  @param color A color different from label.TextColor
 */
+ (void)setAnotherColor:(UIColor *)color;

/**
 *  Set a highlight font to show emphasis between the beginmark and endmark
 *
 *  @param font A font different from label.font
 */
+ (void)setAnotherFont:(UIFont *)font;

/**
 *  Instance method to set color, the priority is higher.
 *
 */
- (void)setAnotherColor:(UIColor *)color;

/**
 *  Instance method to set font, the priority is higher.
 *
 */
- (void)setAnotherFont:(UIFont *)font;

- (void)setAnotherTest:(NSString *)text;

/**
 *  The color for this label instance
 */
@property(nonatomic,strong)UIColor *anotherColor;
/**
 *  The font for this label instance
 */
@property(nonatomic,strong)UIFont *anotherFont;

@end

NS_ASSUME_NONNULL_END
