//
//  BaseModel.m
//  TMSDriver
//
//  Created by mac on 2019/1/28.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"xid":@"id"}];
}
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return true;
}
@end
