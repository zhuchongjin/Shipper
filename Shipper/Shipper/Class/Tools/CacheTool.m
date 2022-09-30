//
//  CacheTool.m
//  Shipper
//
//  Created by zcj on 2022/9/30.
//  Copyright © 2022 admin. All rights reserved.
//

#import "CacheTool.h"
#import <Foundation/Foundation.h>
#import <SAMKeychain/SAMKeychain.h>
@implementation CacheTool

+(void)clearAllUserDefaultsData{

    NSUserDefaults*userDefaults = [NSUserDefaults  standardUserDefaults];
    NSDictionary*dic = [userDefaults  dictionaryRepresentation];
    for(id key in dic) {
        
//        if ([key isEqualToString:CJMainURLChange]) {
//
//        }else{
//            [userDefaults  removeObjectForKey:key];
//        }
        
    }
   [userDefaults  synchronize];
}

@end
