//
//  UIColor+cjColor.m
//  ShipperMent
//
//  Created by admin on 2022/9/28.
//

#import "UIColor+CJColor.h"

@implementation UIColor (CJColor)

+ (UIColor *)cjRandomColor
{
    return CJRandomColor;
}

+ (UIColor *)cjClearColor{
  
    return [UIColor clearColor];
}

+ (UIColor *)cjBackgroundColor{
    
    return CJHexColor(0xf3f8ff);
}

+ (UIColor *)cjLineBackGroundColor{
    
    return CJHexColor(0xEBEBEB); //CJRGBColor(229, 229, 229);
}
+ (UIColor *)cjMainColor{
    return CJHexColor(0x2D7DF6);

}


/// 主题色 字体
+ (UIColor *)cjMainColorText{
    return CJHexColor(0x2D7DF6);

}

/**
 主 字体颜色
 
 @return <#return value description#>
 */
+ (UIColor *)cjMainTextColor{
    
    return CJHexColor(0x3A425C);
}

/**
 次级 颜色字体
 
 @return <#return value description#>
 */
+ (UIColor *)cjSubheadTextColor{
    
    return CJHexColor(0x96A0B9);

}

+ (UIColor *)cjStarRateColor{
    
    return CJHexColor(0xFF7E15 );

}
+ (UIColor *)cjEmptyStarRateColor{
    
    return CJHexColor(0xB5CAEA);

}


/// 分割线颜色
+ (UIColor *)cjLineColor{
    
    return CJHexColor(0xE4E9ED);

}
// 基础色

+ (UIColor *)cjWhiteColor{
    
    return [UIColor whiteColor];
}
+ (UIColor *)cjBlackColor{
    
    return [UIColor blackColor];
}

+ (UIColor *)cjGrayColor{
    
    return [UIColor grayColor];
}

+ (UIColor *)cjLightGrayColor{
    
    return [UIColor lightGrayColor];
}

+ (UIColor *)cjBlueColor{
    
    return [UIColor blueColor];
}

+ (UIColor *)cjRedColor;{
    
    return [UIColor redColor];
}


@end
