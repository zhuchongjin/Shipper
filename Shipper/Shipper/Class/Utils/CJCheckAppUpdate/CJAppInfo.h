//
//  CJAppInfo.h
//  PengYuanDeShipper
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJAppInfo : NSObject


/// 当前app的版本
+ (NSString *)appVersion;


/// app名称
+ (NSString *)appName;


///app的内建版本
+ (NSString *)appBuildVersion;


/// appBundleId
+ (NSString *)appBundleId;

///  app在itunes 的url
+ (NSString *)appUrlInItunes;

+ (CGFloat)systemVersion;

@end

NS_ASSUME_NONNULL_END
