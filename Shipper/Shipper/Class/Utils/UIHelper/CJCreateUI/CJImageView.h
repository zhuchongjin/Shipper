//
//  CJImageView.h
//  CJUIFactory
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019年 zcj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJImageView : UIImageView

+ (CJImageView *)imgInit;

- (CJImageView *(^)(CGRect frame))imgVFrame;

- (CJImageView *(^)(NSString *imgName))imgVImageName;

- (CJImageView *(^)(UIColor *color))imgVbgColor;

- (CJImageView *(^)(UIViewContentMode contentMode))imgVContentMode;

- (CJImageView *(^)(CGFloat cornerRadius))imgVCornerRadius;

//- (CJImageView *(^)(BOOL cutRound))imgVWheatherCutRound;


@end


NS_ASSUME_NONNULL_END
