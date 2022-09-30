//
//  CJTextField.m
//  CJUIFactory
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019年 zcj. All rights reserved.
//

#import "CJTextField.h"

@implementation CJTextField

+ (CJTextField *)tfInit{
    CJTextField *field = [[CJTextField alloc]init];
    field.clearButtonMode = UITextFieldViewModeWhileEditing;
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.font = [UIFont cjTitleFont14];
    field.textColor = [UIColor cjMainTextColor];
    field.borderStyle = UITextBorderStyleNone;
    field.placeholder = @"请输入内容";
//    [field setValue:[UIFont cjTitleFont12] forKeyPath:@"_placeholderLabel.font"];
    Ivar ivar = class_getInstanceVariable([CJTextField class], "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(field, ivar);
//    placeholderLabel.textColor = color;
    placeholderLabel.font = [UIFont cjTitleFont12];
    return field;
}

- (CJTextField *(^)(CGRect frame))tfFrame{
    
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (CJTextField *(^)(NSString *text))tfText{
    
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (CJTextField *(^)(UIKeyboardType keyBoardType))tfKeyBoardType{
    
    return ^(UIKeyboardType keyBoardType){
        self.keyboardType = keyBoardType;
        return self;
    };
}

- (CJTextField *(^)(BOOL secureTextEntry))tfSecureTextEntry{
    
    return ^(BOOL secureTextEntry){
        self.secureTextEntry = secureTextEntry;
        return self;
    };
}


- (CJTextField *(^)(UIFont *font))tfFont{
    
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (CJTextField *(^)(NSString *placeholder))tfplaceholder{
    return ^(NSString *placeholder){
        self.placeholder = placeholder;
        return self;
    };
}

- (CJTextField *(^)(UIColor *color,UIFont *font))tfplaceholderColorAndFont{
    
    return ^(UIColor *color,UIFont *font){
//        [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
//        [self setValue:font forKeyPath:@"_placeholderLabel.font"];
      
        Ivar ivar = class_getInstanceVariable([UITextField class], "_placeholderLabel");
        UILabel *placeholderLabel = object_getIvar(self, ivar);
        placeholderLabel.textColor = color;
        placeholderLabel.font = font;
        
        return self;
    };
}


- (CJTextField *(^)(UIColor *color))tfTextColor{
    
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (CJTextField *(^)(NSTextAlignment aligment))tfTextAlignment{
    
    return  ^(NSTextAlignment aligment){
        self.textAlignment = aligment;
        return self;
    };
}

- (CJTextField *(^)(id<UITextFieldDelegate> delegate))tfDelegate{
    
    return ^(id<UITextFieldDelegate> delegate){
        self.delegate = delegate;
        return self;
    };
}

- (CJTextField *(^)(UITextBorderStyle borderStyle))tfborderStyle{
    
    return ^(UITextBorderStyle borderStyle){
        self.borderStyle = borderStyle;
        return self;
    };
}


- (CJTextField *(^)(UITextFieldViewMode clearButtonMode))tfclearButtonMode{
    
    return ^(UITextFieldViewMode clearButtonMode){
        self.clearButtonMode = clearButtonMode;
        return self;
    };
}

- (CJTextField *(^)(NSAttributedString *attributedText))tfAttributedText{
    
    return ^(NSAttributedString *attributedText){
        self.attributedText = attributedText;
        return self;
    };
    
}


- (CJTextField *(^)(NSString *strTitle,UIFont *font))tfLeftViewTitleAndFont{
    
    return ^(NSString *strTitle,UIFont *font){
        UILabel *leftView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [self getWidthWithTitle:strTitle font:font]+ LW(5), self.frame.size.height)];
        leftView.text = strTitle;
        leftView.textColor = [UIColor cjSubheadTextColor];
        leftView.font = font;
        leftView.textAlignment = NSTextAlignmentLeft;
        leftView.contentMode = UIViewContentModeCenter;
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
        return self;
    };
}


- (CJTextField *(^)(NSString *imgVName))tfRightView{
    
    return ^(NSString *imgVName){
        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:imgVName]];
        self.rightView=image;
        self.rightViewMode = UITextFieldViewModeAlways;
        return self;
    };
}

- (CJTextField *(^)(NSString *imgVName))tfLeftView{
  
    return ^(NSString *imgVName){
        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:imgVName]];
        self.leftView=image;
        self.leftViewMode = UITextFieldViewModeAlways;
        return self;
    };
}


/**
 根据 字体内容 大小 计算长度

 @param title <#title description#>
 @param font <#font description#>
 @return <#return value description#>
 */
- (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}

@end
