//
//  UIView+Extension.h
//  TongChengCTMS
//
//  Created by mac on 02/08/18.
//  Copyright © 2018 zhuchongjin. All rights reserved.
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

@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

/**
 *  获取当前view所在的控制器
 */
- (UIViewController*)getCurrentViewController;

@end

