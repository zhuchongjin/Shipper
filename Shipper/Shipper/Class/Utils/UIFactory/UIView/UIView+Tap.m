//
//  UIView+Tap.m
//  TongChengCTMS
//
//  Created by mac on 02/08/18.
//  Copyright © 2018 zhuchongjin. All rights reserved.
//

#import "UIView+Tap.h"
#import <objc/runtime.h>
/**
 *  动态添加手势
 */
static const char *ActionHandlerTapGestureKey;

@implementation UIView (Tap)

- (void)setTapActionWithBlock:(void (^)(void))block {
     
     self.userInteractionEnabled = YES;
     
     UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &ActionHandlerTapGestureKey);
     
     if (!gesture) {
          gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
          [self addGestureRecognizer:gesture];
          objc_setAssociatedObject(self, &ActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
     }
     
     objc_setAssociatedObject(self, &ActionHandlerTapGestureKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture {
     if (gesture.state == UIGestureRecognizerStateRecognized)  {
          void(^action)(void) = objc_getAssociatedObject(self, &ActionHandlerTapGestureKey);
          if (action)  {
               action();
          }
     }
}


@end

