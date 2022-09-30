//
//  WidthAndHeight.h
//  临沂
//
//  Created by zcj on 2017/11/7.
//  Copyright © 2017 xiaoruiyun.com. All rights reserved.
//

#ifndef WidthAndHeight_h
#define WidthAndHeight_h

#define CJToLeftMargin   10  // 距离左右边距的距离
#define CJToViewMarginH  10  // 两个view 之间的模块分割
#define CJCellTopPadding  5  //
#define CJLineHeight      1
#define CJUICornerWidth   1
#define CJUICutCorner     5 // 圆角
// yeufeu
#define CJCellLabHeight     LW(40)  //labxiashi gaodu
#define CJCellTwoLabPadding  LW(3)
#define CJBottomBtnHeight 44


//// 最新设配
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight   self.navigationController.navigationBar.frame.size.height  //44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

//根据ip6的屏幕来拉伸
#define LW(with) ((with)*(kScreenWidth/375.0f))
#define LH(height) ((height)*(kScreenHeight/667.0f))
#define SafeAreaBottomHeight (SCREEN_HEIGHT == 812.0 ? 34 : 0)
#define TabBarHeight 49

// 操作系统版本号
#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
// 是否横竖屏
// 用户界面横屏了才会返回YES
#define IS_LANDSCAPE UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])
// 无论支不支持横屏，只要设备横屏了，就会返回YES
#define IS_DEVICE_LANDSCAPE UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])

// 屏幕宽度，跟横竖屏无关
#define DEVICE_WIDTH (IOS_VERSION >= 8.0 ? (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width) : [[UIScreen mainScreen] bounds].size.width)

// 屏幕高度，跟横竖屏无关
#define DEVICE_HEIGHT (IOS_VERSION >= 8.0 ? (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height) : [[UIScreen mainScreen] bounds].size.height)

// 屏幕高度，会根据横竖屏的变化而变化
#define SCREEN_HEIGHT (IOS_VERSION >= 8.0 ? [[UIScreen mainScreen] bounds].size.height : (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height))

// 屏幕宽度，会根据横竖屏的变化而变化
#define SCREEN_WIDTH (IOS_VERSION >= 8.0 ? [[UIScreen mainScreen] bounds].size.width : (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width))

// 设备屏幕尺寸
#define IS_55INCH_SCREEN [QMUIHelper is55InchScreen]
#define IS_47INCH_SCREEN [QMUIHelper is47InchScreen]
#define IS_40INCH_SCREEN [QMUIHelper is40InchScreen]
#define IS_35INCH_SCREEN [QMUIHelper is35InchScreen]

// 是否Retina
#define IS_RETINASCREEN ([[UIScreen mainScreen] scale] >= 2.0)

// 是否放大模式
#define IS_ZOOMEDMODE ([[UIScreen mainScreen] respondsToSelector:@selector(nativeScale)] ? ([UIScreen mainScreen].nativeScale > [[UIScreen mainScreen] scale]) : NO)

///** 系统和版本号 */
//#define sDevice [UIDevice currentDevice]
//#define DeviceName sDevice.name                           // 设备名称
//#define DeviceModel sDevice.model                         // 设备类型
//#define DeviceLocalizedModel sDevice.localizedModel       // 本地化模式
//#define DeviceSystemName sDevice.systemName               // 系统名字
//#define DeviceSystemVersion sDevice.systemVersion         // 系统版本
//#define DeviceOrientation sDevice.orientation             // 设备朝向
//#define DeviceUUID sDevice.identifierForVendor.UUIDString // UUID
//#define iOS8 ([DeviceSystemVersion floatValue] >= 8.0)   // iOS8以上
//#define iPhone ([DeviceModel rangeOfString:@"iPhone"].length > 0)
//#define iPod ([DeviceModel rangeOfString:@"iPod"].length > 0)
//#define iPad (sDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)

//是否为空或是[NSNull null]
//#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
//#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))
//
////字符串是否为空
//#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
////数组是否为空
//#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))


#endif /* WidthAndHeight_h */
