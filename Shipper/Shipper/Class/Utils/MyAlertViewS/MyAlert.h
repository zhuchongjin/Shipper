//
//  MyAlert.h
//  TMSDriver
//
//  Created by mac on 2019/1/23.
//  Copyright © 2019年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CJAlertViewCompletionBlock)(BOOL cancelled, NSInteger buttonIndex);
@interface MyAlert : UIView

@property (nonatomic,assign) CGFloat alertCornerRadius;
@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIColor *messageColor;
@property (nonatomic,strong) UIColor *cancleTitleColor;
@property (nonatomic,strong) UIColor *otherTitleColor;

+ (instancetype)showAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                       cancelTitle:(NSString *)cancelTitle
                        otherTitle:(NSString *)otherTitle
                        completion:(CJAlertViewCompletionBlock)completion;
-(void)setAlertTitleColor:(UIColor*)titleColor titleFont:(UIFont*)titleFont;
-(void)setAlertMessageColor:(UIColor*)messageColor messageFont:(UIFont*)messageFont;
-(void)setAlertCancleTitleColor:(UIColor*)cancleTitleColor cancleTitleFont:(UIFont*)cancleTitleFont;
-(void)setAlertOtherTitleColor:(UIColor*)otherTitleColor otherTitleFont:(UIFont*)otherTitleFont;

@end
