//
//  CJDateTime.m
//  NtoccShipper
//
//  Created by mac on 2020/10/30.
//  Copyright © 2020 admin. All rights reserved.
//

#import "CJDateTime.h"

@implementation CJDateTime


+(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    NSLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
    
}


+ (NSString *)getCurrentTimesType:(CJDateTimeMode )dateTimeType{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制

    switch (dateTimeType) {
            
        case CJDateTimeModeYMDHMS:
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        case CJDateTimeModeYMD:
            [formatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case CJDateTimeModeYMDHM:
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
            
        case CJDateTimeModeYMDHMSAndString:
            [formatter setDateFormat:@"yyyyMMddHHmmss"];
            break;
        case CJDateTimeModeYMDHAndString:
            [formatter setDateFormat:@"yyyyMMddHH"];
            break;
            
        default:
            break;
    }

    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    NSLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
}


/// 时间戳 毫秒
+(NSString *)getNowTimeTimestamp{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;

    [formatter setDateStyle:NSDateFormatterMediumStyle];

    [formatter setTimeStyle:NSDateFormatterShortStyle];

    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // 设置想要的格式，hh与HH的区别:分别表示12小时制,24小时制

    //设置时区,这一点对时间的处理有时很重要

    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];

    [formatter setTimeZone:timeZone];

    NSDate *datenow = [NSDate date];

    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];

    return timeSp;

}


#pragma mark ----------时间对比-----

+ (NSDateComponents *)components:(NSCalendarUnit )unit timesType:(CJDateTimeMode )dateTimeType fromStrDate:(NSString *)strStartData toStrDate:(NSString *)strEndDate{
    
    //创建两个日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    switch (dateTimeType) {
            
        case CJDateTimeModeYMDHMS:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        case CJDateTimeModeYMD:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case CJDateTimeModeYMDHM:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
            
//        case CJDateTimeModeYMDHMSAndString:
//            [formatter setDateFormat:@"yyyyMMddHHmmss"];
//            break;
//
        default:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];

            break;
    }

    
    NSDate *startDate = [dateFormatter dateFromString:strStartData];
    NSDate *endDate = [dateFormatter dateFromString:strEndDate];

    //利用NSCalendar比较日期的差异
    NSCalendar *calendar = [NSCalendar currentCalendar];
    /**
     * 要比较的时间单位,常用如下,可以同时传：
     *    NSCalendarUnitDay : 天
     *    NSCalendarUnitYear : 年
     *    NSCalendarUnitMonth : 月
     *    NSCalendarUnitHour : 时
     *    NSCalendarUnitMinute : 分
     *    NSCalendarUnitSecond : 秒
     */
//    NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
    //比较的结果是NSDateComponents类对象
    NSDateComponents *delta = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    //打印
//    DLog(@"%@",delta);
//    //获取其中的"天"
//    DLog(@"%ld",delta.day);
    
    return delta;
}

@end

