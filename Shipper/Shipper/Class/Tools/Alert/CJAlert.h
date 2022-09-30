//
//  CJAlert.h
//  TMSDriver
//
//  Created by mac on 2019/1/22.
//  Copyright © 2019年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NextStepBlock)(NSString *strSure);

@interface CJAlert : NSObject
+ (void)showStringDismissWithDelay:(NSString *)str;
+ (void)showLoading;
+ (void)dismiss;
+ (CJAlert *)shared;
- (void)showStringTitle:(NSString *)str nextStep:(NextStepBlock )nextStep;


/// 提示信息
/// - Parameter statues: <#statues description#>
extern void ShowMessage(NSString *_Nullable statues);

@end

