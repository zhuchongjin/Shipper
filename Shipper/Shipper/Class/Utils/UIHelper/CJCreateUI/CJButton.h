//
//  CJButton.h
//  CJUIFactory
//
//  Created by mac on 2019/4/12.
//  Copyright © 2019年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  按钮中图片的位置
 */
typedef NS_ENUM(NSUInteger, CJImageAlignment) {
    /**
     *  图片在左，默认
     */
    CJImageAlignmentLeft = 0,
    /**
     *  图片在上
     */
    CJImageAlignmentTop,
    /**
     *  图片在下
     */
    CJImageAlignmentBottom,
    /**
     *  图片在右
     */
    CJImageAlignmentRight,
};

typedef  NS_ENUM(NSUInteger, CJButtonRectCorner){
    
    /**
     *  全切
     */
    CJButtonRectCornerAll = 0,
    /**
     *  左上
     */
    CJButtonRectCornerLeftTop,
    /**
     *   左下
     */
    CJButtonRectCornerLeftBottom,
    /**
     *  左上左下
     */
    CJButtonRectCornerLeftTopBottom,
    /**
     *  右上
     */
    CJButtonRectCornerRightTop,
    /**
     *  右下
     */
    CJButtonRectCornerRightBottom,
    /**
     *  右上
     */
    CJButtonRectCornerRightTopBottom,
};

@interface CJButton : UIButton

+ (CJButton *)btnInit;

- (CJButton *(^)(CGRect frame))btnFrame;

/**
 btn 背景色
 */
- (CJButton *(^)(UIColor *color))btnBgColor;

/**
 btn 设置 Normaltext
 */
- (CJButton *(^)(NSString *text))btnText;

/**
 btn 设置 Select text
 */
- (CJButton *(^)(NSString *text))btnSelectText;
/**
 btn 字体大小
 */
- (CJButton *(^)(CGFloat size))btnFontSize;

- (CJButton *(^)(UIFont *textFont))btnFont;

/**
 普通的title的颜色
 */
- (CJButton *(^)(UIColor *normalTitleColor))btnNormalTitleColor;

/**
 选中的文本title的颜色
 */
- (CJButton *(^)(UIColor *selectTitleColor))btnSelectTitleColor;

/**
 设置tag
 */
- (CJButton *(^)(NSInteger tag))btnSetTag;

/**
 btn 设置背景图片 Name
 */
- (CJButton *(^)(NSString *imageName))btnBgImg;


/**
 btn 设置normalImage
 */
- (CJButton *(^)(NSString *normalImageName))btnNormalImgName;


/**
 btn 设置高亮状态的图片
 */
- (CJButton *(^)(NSString *highlightImageName))btnHighlightImgName;


/**
 btn 设置选中的图片
 */
- (CJButton *(^)(NSString *selectImageName))btnSelectImgName;

/**
 btn target action
 */
- (CJButton *(^)(id target, SEL sel))btnTargetAction;

/**
 btn 设置圆角
 */
- (CJButton *(^)(CGFloat radius))btnCornerRadius;

/**
 btn 设置圆角边线的颜色
 */
- (CJButton *(^)(UIColor *color))btnCornerColor;

/**
 btn 设置圆角边线的宽度
 */
- (CJButton *(^)(CGFloat width))btnCornerWidth;




/**
 btn 文本靠边方式 以及换行
 */
- (CJButton *(^)(NSTextAlignment aligment))btnTextAligmentAndLineNums;


/**
 *  按钮中图片的位置
 */

- (CJButton *(^)(CJImageAlignment imageAlignment))btnImgAlignment;


/**
 *  按钮中图片与文字的间距
 */

- (CJButton *(^)(CGFloat spaceBetweenTitleAndImage)) btnSpaceBetweenTitleAndImage;

/**
 文字 靠左还是靠右
 UIControlContentHorizontalAlignmentCenter = 0,
 UIControlContentHorizontalAlignmentLeft   = 1,
 UIControlContentHorizontalAlignmentRight  = 2,
 UIControlContentHorizontalAlignmentFill   = 3,
 */
- (CJButton *(^)(UIControlContentHorizontalAlignment btnTitleHorizontalAlignment)) btnTitleHorizontalAlignment;


// 切圆角的问题

/**
 切圆角
 */
- (CJButton *(^)(CJButtonRectCorner btnCorner ,CGFloat radius ))btnRectCornerRadius;

@end

NS_ASSUME_NONNULL_END
