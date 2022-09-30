//
//  CacheTool.h
//  Shipper
//
//  Created by zcj on 2022/9/30.
//  Copyright © 2022 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CacheTool : NSObject

/// 清理缓存
+(void)clearAllUserDefaultsData;

@end

NS_ASSUME_NONNULL_END
