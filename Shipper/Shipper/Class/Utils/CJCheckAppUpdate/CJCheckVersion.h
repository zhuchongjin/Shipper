//
//  CJCheckVersion.h
//  PengYuanDeShipper
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJCheckVersion : NSObject

+ (instancetype)shareCheckVersion;
- (void)checkVersion;
@end

NS_ASSUME_NONNULL_END
