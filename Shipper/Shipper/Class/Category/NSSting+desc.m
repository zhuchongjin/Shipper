//
//  NSSting+desc.m
//  Shipper
//
//  Created by zcj on 2022/9/30.
//  Copyright © 2022 admin. All rights reserved.
//

#import "NSSting+desc.h"

@implementation NSString (desc)
+ (NSString *)nullToString:(id)idx{
    NSString *str = CJStringWithFormat(@"%@",idx);
    if (IsNilOrNull(idx) ||[str isEqualToString:@"null"] ||[str isEqualToString:@"(null)"] ||[str isEqualToString:@"NULL"] ||[str isEqualToString:@"(NULL)"] ||[str isEqualToString:@"nil"] ||[str isEqualToString:@"(nil)"] ||[str isEqualToString:@"NIL"] ||[str isEqualToString:@"(NIL)"]) {
        return @"";
    }else{
        return str;
    }
}

@end
