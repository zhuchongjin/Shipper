//
//  CJDateTime.h
//  NtoccShipper
//
//  Created by mac on 2020/10/30.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 时间
typedef NS_ENUM(NSInteger, CJDateTimeMode) {
   
    /**
     【yyyy-MM-dd HH:mm:ss】年月日时分秒
     */
    CJDateTimeModeYMDHMS = 0,
    
    /**
     【yyyy-MM-dd】年月日
     */
    CJDateTimeModeYMD,
    
    /**
     【yyyy-MM-dd HH:mm】年月日时分
     */
    CJDateTimeModeYMDHM,
    
    /**
     【yyyyMMddHHmm:ss】年月日时分秒  纯字符
     */
    CJDateTimeModeYMDHMSAndString,
    /**
     【yyyyMMddHHmm:ss】年月日时  纯字符
     */
    CJDateTimeModeYMDHAndString,

};


@interface CJDateTime : NSObject

/// 获取当前时间
/// @param dateTimeType <#dateTimeType description#>
+ (NSString *)getCurrentTimesType:(CJDateTimeMode )dateTimeType;

/// 时间戳 毫秒
+(NSString *)getNowTimeTimestamp;


#pragma mark ----------时间对比-----

/// 时间对比 差  返回NSDateComponents类
/// @param unit 比较类型 具体查看 实现方法
/// @param dateTimeType 比较时间类型
/// @param strStartData 开始时间 2020-07-11 等标准时间格式
/// @param strEndDate 结束时间
+ (NSDateComponents *)components:(NSCalendarUnit )unit timesType:(CJDateTimeMode )dateTimeType fromStrDate:(NSString *)strStartData toStrDate:(NSString *)strEndDate;

@end

NS_ASSUME_NONNULL_END

