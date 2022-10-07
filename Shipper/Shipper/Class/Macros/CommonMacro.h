//
//  CommonMacro.h
//  临沂
//
//  Created by admin on 2017/11/7.
//  Copyright © 2017 xiaoruiyun.com. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

////show_type
//static const NSInteger NOPIC = 0;

#undef    __INT
#define __INT( __x )            [NSNumber numberWithInteger:(NSInteger)__x]

#define LOGOUT  @"other_Logout"
#define KEYWINDOW [UIApplication sharedApplication].keyWindow

//#define NSEaseLocalizedString(key, comment) [[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"EaseUIResource" withExtension:@"bundle"]] localizedStringForKey:(key) value:@"" table:nil]

//#define DefaultLocationTimeout 10
//#define DefaultReGeocodeTimeout 5
// 加载本地图片
#define UIImageNamed(imageName) [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAutomatic]

//#define NSEaseLocalizedString(key, comment) [[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"EaseUIResource" withExtension:@"bundle"]] localizedStringForKey:(key) value:@"" table:nil]

/******* 消息通知 *******/
#define CJAJNotification   [NSNotificationCenter defaultCenter]

#define CJRegisterNotify(_name, _selector)                    \
[[NSNotificationCenter defaultCenter] addObserver:self  \
selector:_selector name:_name object:nil];

#define CJRemoveNofify            \
[[NSNotificationCenter defaultCenter] removeObserver:self];

#define CJSendNotify(_name, _object)  \
[[NSNotificationCenter defaultCenter] postNotificationName:_name object:_object];

// 获取上层窗口
#define GetWindow  [UIApplication sharedApplication].windows[0]
//  UIWindow * window = [UIApplication sharedApplication].windows[0]
/** 系统和版本号 */
#define sDevice [UIDevice currentDevice]
#define DeviceName sDevice.name                           // 设备名称
#define DeviceModel sDevice.model                         // 设备类型
#define DeviceLocalizedModel sDevice.localizedModel       // 本地化模式
#define DeviceSystemName sDevice.systemName               // 系统名字
#define DeviceSystemVersion sDevice.systemVersion         // 系统版本
#define DeviceOrientation sDevice.orientation             // 设备朝向
#define DeviceUUID sDevice.identifierForVendor.UUIDString // UUID
#define iOS8 ([DeviceSystemVersion floatValue] >= 8.0)   // iOS8以上
#define iPhone ([DeviceModel rangeOfString:@"iPhone"].length > 0)
#define iPod ([DeviceModel rangeOfString:@"iPod"].length > 0)
#define iPad (sDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
/******* 设备型号和系统 *******/

//是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))
//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))
// 字符串拼接
#define CJStringWithFormat(format,...)[NSString stringWithFormat:format,##__VA_ARGS__]

// ━━━━━━━━━━━━━━━━━━━━ 类型检查 ━━━━━━━━━━━━━━━━━━━━
#define StringCheck(value) ((NSString *)([value isKindOfClass:[NSString class]] ? value : \
                            [value isKindOfClass:[NSNumber class]] ? [(NSNumber *)value stringValue] : @""))
#define NumberCheck(value) ((NSNumber *)([value isKindOfClass:[NSNumber class]] ? value : @0))
#define ArrayCheck(value) ((NSArray *)([value isKindOfClass:[NSArray class]] ? value : @[]))
#define DictionaryCheck(value) ((NSDictionary *)([value isKindOfClass:[NSDictionary class]] ? value : @{}))



#ifdef DEBUG
#define DLog(format, ...) printf("^^类名:<地址:%p 控制器:%s:(行号:%d) > \n^^方法名:%s \n^^打印内容:%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define DLog(format, ...)
#endif


/**
 *  弱指针
 */
//#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

// 存取 shan
#define CJSaveMyDefault(key,value) [[NSUserDefaults standardUserDefaults] setObject:value forKey:key] 
#define CJFetchMyDefault(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define CJRemoveMyDefault(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key] 

/*safe release*/
#undef TT_RELEASE_SAFELY
#define TT_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF)) \
{\
CFRelease(__REF); \
__REF = nil;\
}\
}

//view安全释放
#undef TTVIEW_RELEASE_SAFELY
#define TTVIEW_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF))\
{\
[__REF removeFromSuperview];\
CFRelease(__REF);\
__REF = nil;\
}\
}

//释放定时器
#undef TT_INVALIDATE_TIMER
#define TT_INVALIDATE_TIMER(__TIMER) \
{\
[__TIMER invalidate];\
[__TIMER release];\
__TIMER = nil;\
}

#else

/*safe release*/
#undef TT_RELEASE_SAFELY
#define TT_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF)) \
{\
__REF = nil;\
}\
}

//view安全释放
#define TTVIEW_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF))\
{\
[__REF removeFromSuperview];\
__REF = nil;\
}\
}

//释放定时器
#define TT_INVALIDATE_TIMER(__TIMER) \
{\
[__TIMER invalidate];\
__TIMER = nil;\
}

#endif

/* CommonMacro_h */
