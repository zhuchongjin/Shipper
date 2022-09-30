//
//  CJView.m
//  CJUIFactory
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019年 zcj. All rights reserved.
//

#import "CJView.h"

@implementation CJView


+ (CJView *)viewInit {
    
    CJView *view = [[CJView alloc] init];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor whiteColor];
//    view.userInteractionEnabled = YES;
    return view;
}

// 设置frame
- (CJView *(^)(CGRect frame))viewFrame{
    
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

// 设置背景色
- (CJView *(^)(UIColor *color))viewbgColor{
    
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

// 设置边框
- (CJView *(^)(CGFloat borderWidth,UIColor *borderColor))viewBorderWidthColor{
    
    return ^(CGFloat borderWidth,UIColor *borderColor){
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}
//- (CJView *(^)(CGFloat cornerRadius)viewCornerRadius{
//
//    return ^(CGFloat cornerRadius){
//        self.layer.borderWidth = cornerRadius;
//        return self;
//    };
//}

- (CJView *(^)(CGFloat cornerRadius))viewCornerRadius{
   
   return ^(CGFloat cornerRadius){
       self.layer.cornerRadius = cornerRadius;
       return self;
   };
}

@end
