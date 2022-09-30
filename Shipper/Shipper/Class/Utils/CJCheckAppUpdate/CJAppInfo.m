//
//  CJAppInfo.m
//  PengYuanDeShipper
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import "CJAppInfo.h"
#include <sys/utsname.h>
@implementation CJAppInfo

+ (NSString *)appVersion{
   return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appName{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

+ (NSString *)appBuildVersion{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+ (NSString *)appBundleId{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

+ (NSString *)appUrlInItunes{
    return  [NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?bundleId=%@",self.appBundleId];
}

+ (CGFloat)systemVersion{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

@end
