//
//  UIView+Extension.h
//  jinyingmeileNative
//
//  Created by admin on 02/01/2017.
//  Copyright © 2017 Jinyingmeile. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (Extension)

- (UIViewController *)myViewController;

- (void)cornerRadius:(CGFloat)size;

- (id)findResponderWithClass:(Class)aclass;

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

/**
 *  获取当前view所在的控制器
 */
- (UIViewController*)getCurrentViewController;

@end
