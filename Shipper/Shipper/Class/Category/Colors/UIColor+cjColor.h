//
//  UIColor+cjColor.h
//  ShipperMent
//
//  Created by zcj on 2022/9/28.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define CJHexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define CJRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// 自定义颜色
#define CJRGBColor(R,G,B) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]
// 随机色
#define CJRandomColor CJRGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface UIColor (CJColor)

/**
 随机色

 @return <#return value description#>
 */
+ (UIColor *)cjRandomColor;


+ (UIColor *)cjClearColor;


/**
 主题色

 @return <#return value description#>
 */
+ (UIColor *)cjMainColor;

/// 主题色 字体
+ (UIColor *)cjMainColorText;

/**
 背景色

 @return <#return value description#>
 */
+ (UIColor *)cjBackgroundColor;

/**
 分割线背景色

 @return <#return value description#>
 */
+ (UIColor *)cjLineBackGroundColor;
/**
 主 字体颜色

 @return <#return value description#>
 */
+ (UIColor *)cjMainTextColor;

/**
 次级 颜色字体

 @return <#return value description#>
 */
+ (UIColor *)cjSubheadTextColor;

+ (UIColor *)cjStarRateColor;
+ (UIColor *)cjEmptyStarRateColor;

/// 分割线颜色
+ (UIColor *)cjLineColor;
// 基础色

+ (UIColor *)cjWhiteColor;

+ (UIColor *)cjBlackColor;

+ (UIColor *)cjGrayColor;

+ (UIColor *)cjLightGrayColor;

+ (UIColor *)cjBlueColor;

+ (UIColor *)cjRedColor;

@end

NS_ASSUME_NONNULL_END
