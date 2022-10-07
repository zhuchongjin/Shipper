//
//  UIFont+CJFont.m
//  CJUIFactory
//
//  Created by mac on 2019/4/23.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "UIFont+CJFont.h"
#import <objc/runtime.h>
//#define CJIphone6Height 667.0
#define CJIphone6Width 375.0
#define CJSCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width


@implementation UIFont (CJFont)


+ (void)load {
    // 获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod, method);
}
 
+ (UIFont *)adjustFont:(CGFloat)fontSize {
    UIFont *newFont = nil;
    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width/CJIphone6Width];
//    newFont = [UIFont systemFontOfSize:((CJSCREEN_WIDTH*((fontSize)/CJIphone6Width)))];

    return newFont;
}

+ (UIFont *)cjTitleFontX:(CGFloat )x{
   
//    return [UIFont systemFontOfSize:((CJSCREEN_WIDTH*((x)/CJIphone6Width)))];
    return [UIFont systemFontOfSize:x];

}
+ (UIFont *)cjTitleFont8{
    
    return [UIFont cjTitleFontX:8];
}
+ (UIFont *)cjTitleFont9{
    
    return [UIFont cjTitleFontX:9];
}
+ (UIFont *)cjTitleFont10{
    
    return [UIFont cjTitleFontX:10];
}
+ (UIFont *)cjTitleFont11{
    
    return [UIFont cjTitleFontX:11];
}

+ (UIFont *)cjTitleFont12{
    
    return [UIFont cjTitleFontX:12];
}


+ (UIFont *)cjTitleFont13{
   
        return [UIFont cjTitleFontX:13];
}
+ (UIFont *)cjTitleFont14{
    
        return [UIFont cjTitleFontX:14];
}
+ (UIFont *)cjTitleFont15{
    
        return [UIFont cjTitleFontX:15];
}
+ (UIFont *)cjTitleFont16{
    
        return [UIFont cjTitleFontX:16];
}
+ (UIFont *)cjTitleFont17{
    
        return [UIFont cjTitleFontX:17];
}
+ (UIFont *)cjTitleFont18{
    
        return [UIFont cjTitleFontX:18];
}
+ (UIFont *)cjTitleFont19{
    
        return [UIFont cjTitleFontX:19];
}
+ (UIFont *)cjTitleFont20{
    
        return [UIFont cjTitleFontX:20];
}


@end
