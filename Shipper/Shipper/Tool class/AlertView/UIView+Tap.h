//
//  UIView+Tap.h
//  jinyingmeileNative
//
//  Created by zcj on 17/03/2017.
//  Copyright © 2017 Jinyingmeile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Tap)
/**
 *  动态添加手势
 */
- (void)setTapActionWithBlock:(void (^)(void))block ;


@end
