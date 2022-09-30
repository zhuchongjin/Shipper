//
//  NSNumber+cj_description.h
//  CMTSShipper
//
//  Created by mac on 2020/3/24.
//  Copyright © 2020 admin. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (cj_description)
- (NSString *)cj_desc;
- (NSString *)cj_money_desc;

@end

NS_ASSUME_NONNULL_END
