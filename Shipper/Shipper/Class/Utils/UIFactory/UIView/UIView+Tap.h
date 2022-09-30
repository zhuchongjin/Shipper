//
//  UIView+Tap.h
//  TongChengCTMS
//
//  Created by mac on 02/08/18.
//  Copyright © 2018 zhuchongjin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Tap)
/**
 *  动态添加手势
 */
- (void)setTapActionWithBlock:(void (^)(void))block ;


@end
