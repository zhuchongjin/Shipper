//
//  UIView+Extension.m
//  TongChengCTMS
//
//  Created by mac on 02/08/18.
//  Copyright © 2018 zhuchongjin. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (UIViewController *)myViewController {
     return [self findResponderWithClass:[UIViewController class]];
}

- (void)cornerRadius:(CGFloat)size
{
     if (size == 0) size = self.height * 0.5;
     
     self.layer.cornerRadius = size;
     self.layer.masksToBounds = YES;
     
}

- (id)findResponderWithClass:(Class)aclass
{
     UIResponder *nextResponder = self.nextResponder;
     
     while (nextResponder) {
          
          if ([nextResponder isKindOfClass:aclass]) {
               return nextResponder;
          }
          
          nextResponder = nextResponder.nextResponder;
     }
     
     return nil;
}






- (CGFloat)x {
     return self.frame.origin.x;
}
- (CGFloat)y {
     return self.frame.origin.y;
}
- (CGFloat)width {
     return self.frame.size.width;
}
- (CGFloat)height {
     return self.frame.size.height;
}

- (void)setX:(CGFloat)x {
     CGRect newFrame = self.frame;
     newFrame.origin.x = x;
     self.frame = newFrame;
}
- (void)setY:(CGFloat)y {
     CGRect newFrame = self.frame;
     newFrame.origin.y = y;
     self.frame = newFrame;
}
- (void)setWidth:(CGFloat)width {
     CGRect newFrame = self.frame;
     newFrame.size.width = width;
     self.frame = newFrame;
}
- (void)setHeight:(CGFloat)height {
     CGRect newFrame = self.frame;
     newFrame.size.height = height;
     self.frame = newFrame;
}

- (CGFloat)left {
     return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
     CGRect frame = self.frame;
     frame.origin.x = x;
     self.frame = frame;
}

- (CGFloat)top {
     return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
     CGRect frame = self.frame;
     frame.origin.y = y;
     self.frame = frame;
}

- (CGFloat)right {
     return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
     CGRect frame = self.frame;
     frame.origin.x = right - frame.size.width;
     self.frame = frame;
}

- (CGFloat)bottom {
     return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
     CGRect frame = self.frame;
     frame.origin.y = bottom - frame.size.height;
     self.frame = frame;
}

- (CGSize)size {
     return self.frame.size;
}

- (void)setSize:(CGSize)size {
     CGRect frame = self.frame;
     frame.size = size;
     self.frame = frame;
}


- (UIViewController*)getCurrentViewController {
     for (UIView* next = [self superview]; next; next = next.superview) {
          UIResponder* nextResponder = [next nextResponder];
          if ([nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UIViewController class]]) {
               return (UIViewController*)nextResponder;
          }
     }
     return nil;
}
@end

