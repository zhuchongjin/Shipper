//
//  UITextField+placeholder.m
//  Shipper
//
//  Created by mac on 2020/1/17.
//  Copyright © 2020 admin. All rights reserved.
//

#import "UITextField+placeholder.h"

//#import <AppKit/AppKit.h>
#import <objc/message.h>

@implementation UITextField (placeholder)


+ (void)load{
    Method setPlaceholderMethod = class_getInstanceMethod(self, @selector(setPlaceholder:));
    Method cj_setPlaceholderMethod = class_getInstanceMethod(self, @selector(cj_setPlaceholder:));
    method_exchangeImplementations(setPlaceholderMethod, cj_setPlaceholderMethod);
}
 
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    placeholderLabel.textColor = [UIColor cjSubheadTextColor] ;//placeholderColor;
}
 
- (UIColor *)placeholderColor{
    return objc_getAssociatedObject(self, @"placeholderColor");
}
 
- (void)cj_setPlaceholder:(NSString *)placeholder{
    [self cj_setPlaceholder:placeholder];
    self.placeholderColor = self.placeholderColor;

}
@end
