//
//  CJControl.h
//  TMSDriver
//
//  Created by mac on 2019/2/12.
//  Copyright © 2019年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CJControl : NSObject

+(void)clearAllUserDefaultsData;

#pragma mark ----------登录返回信息处理-------


+ (NSString *)getDeviceUUID;

///// 三目 判断值
///// @param idx <#str description#>
//+ (NSString *)getString:(id)idx;

+ (UIViewController *)getCurrentViewController;

@end
