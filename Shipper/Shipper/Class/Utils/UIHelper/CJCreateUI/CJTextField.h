//
//  CJTextField.h
//  CJUIFactory
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJTextField : UITextField

+ (CJTextField *)tfInit;

- (CJTextField *(^)(CGRect frame))tfFrame;

/**
  CJTextField  设置文本
 */
- (CJTextField *(^)(NSString *text))tfText;

- (CJTextField *(^)(UIKeyboardType keyBoardType))tfKeyBoardType;


/**
 CJTextField  密码模式
 */
- (CJTextField *(^)(BOOL secureTextEntry))tfSecureTextEntry;

/**
 CJTextField  设置字体大小
 */
- (CJTextField *(^)(UIFont *font))tfFont;

- (CJTextField *(^)(NSString *placeholder))tfplaceholder;

- (CJTextField *(^)(UIColor *color,UIFont *font))tfplaceholderColorAndFont;


- (CJTextField *(^)(UIColor *color))tfTextColor;

- (CJTextField *(^)(NSTextAlignment aligment))tfTextAlignment;

/**
 CJTextField delegate
 */
- (CJTextField *(^)(id<UITextFieldDelegate> delegate))tfDelegate;

/**
 CJTextField 边角样式 默认圆角
 */
- (CJTextField *(^)(UITextBorderStyle borderStyle))tfborderStyle;

/**
 CJTextField 清除样式 默认编辑时出现
 */
- (CJTextField *(^)(UITextFieldViewMode clearButtonMode))tfclearButtonMode;

/**
 CJTextField 富文本
 */
- (CJTextField *(^)(NSAttributedString *attributedText))tfAttributedText;


//leftView

/**
 CJTextField leftView 左文

 */
- (CJTextField *(^)(NSString *strTitle,UIFont *font))tfLeftViewTitleAndFont;


/**
 CJTextField RinghtView 右图
 
 */
- (CJTextField *(^)(NSString *imgVName))tfRightView;

/**
 CJTextField RinghtView 左图
 
 */
- (CJTextField *(^)(NSString *imgVName))tfLeftView;
@end

NS_ASSUME_NONNULL_END
