//
//  CJLabel.m
//  ControlFactory
//
//  Created by mac on 2019/4/9.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "CJLabel.h"

@implementation CJLabel


// 如果用<>包起来，就会显示高亮颜色。\nc.如果用[]包起来，就会显示高亮的字体
static UIColor  *CJColorLabelAnotherColor;
static UIFont   *CJColorLabelAnotherFont;

typedef NS_ENUM(NSInteger, CJLabelType) {
    CJLabelTypeColor = 1,
    CJLabelTypeFont = 2,
};

/**
 可根据项目不同这这来设置一些通用的属性
 
 后期可根据.x属性重新设置

 @return <#return value description#>
 */
+ (CJLabel *)labInit{
    
    CJLabel *cjLabel = [[CJLabel alloc] init];
    
    cjLabel.font = [UIFont cjTitleFont14];
    cjLabel.textColor = [UIColor cjMainTextColor];
//    cjLabel.backgroundColor = [UIColor cjWhiteColor];
    cjLabel.textAlignment = NSTextAlignmentLeft;
    cjLabel.numberOfLines = 0;

    
    return cjLabel;
}
- (CJLabel *(^)(CGRect frame))labFrame {
    
    return  ^(CGRect frame) {
        self.frame = frame;
        return self;
    };
  
}

- (CJLabel *(^)(NSString *text))labText {
    
    return  ^(NSString *text) {
        self.text = text;
        return self;
    };
}


- (CJLabel *(^)(UIFont *font))labFont {

    return  ^(UIFont *font) {
        self.font = font;
        return self;
    };

}
- (CJLabel *(^)(CGFloat size))labFontSize{

    return  ^(CGFloat size) {
           self.font =  [UIFont cjTitleFontX:size];
       
           return self;
       };
}


- (CJLabel *(^)(BOOL adjustToFit))labAdjustsFontSizeToFitWidth{
    
    return ^(BOOL adjustToFit){
        self.adjustsFontSizeToFitWidth = adjustToFit;
        return self;
    };
}

- (CJLabel *(^)(UIColor *color))labTextColor {
    
    return ^(UIColor *color) {
        self.textColor = color;
        return self;
    };
}
- (CJLabel *(^)(BOOL hidden))labHidden{
    
    return ^(BOOL hidden){
        self.hidden = hidden;
        return self;
    };
}


- (CJLabel *(^)(NSTextAlignment alignment))labAlignment {
    
   return  ^(NSTextAlignment alignment) {
        self.textAlignment = alignment;
        return self;
    };
}


- (CJLabel *(^)(UIColor *color))labBgColor {
    
   return ^(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}


- (CJLabel *(^)(CGFloat radius))labCornerRadius {
    
    return  ^(CGFloat radius) {
//        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;;
        self.layer.cornerRadius = radius;
        return self;
    };
}

- (CJLabel *(^)(CGFloat borderWidth))labBorderWidth{
    
    return ^(CGFloat borderWidth){
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

#pragma mark ---------BorderColor
- (CJLabel *(^)(UIColor *color))labBorderColor{
    
    return ^(UIColor *color){
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (CJLabel *(^)(NSInteger numberLines))labNumLines {
    
     return ^(NSInteger numberLines) {
        self.numberOfLines = numberLines;
        return self;
    };
}


- (CJLabel *(^)(NSLineBreakMode lineBreakMode))labLineBreakMode {
    
    return  ^(NSLineBreakMode lineBreakMode) {
        self.lineBreakMode = lineBreakMode;
        return self;
    };
}


- (CJLabel *(^)(CJLabelRectCorner labCorner ,CGFloat radius ))labRectCornerRadius{
    
    return ^(CJLabelRectCorner labCorner ,CGFloat radius ){
        
        switch (labCorner)
        {
            case CJLabelRectCornerAll:
                [self labRectCornerWith:@"0" radius:radius];
                break;
            case CJLabelRectCornerLeftTop:
                [self labRectCornerWith:@"1" radius:radius];
                break;
            case CJLabelRectCornerLeftBottom:
                [self labRectCornerWith:@"2" radius:radius];
                break;
            case CJLabelRectCornerLeftTopBottom:
                [self labRectCornerWith:@"3" radius:radius];
                break;
            case CJLabelRectCornerRightTop:
                [self labRectCornerWith:@"4" radius:radius];
                break;
            case CJLabelRectCornerRightBottom:
                [self labRectCornerWith:@"5" radius:radius];
                break;
            case CJLabelRectCornerRightTopBottom:
                [self labRectCornerWith:@"6" radius:radius];
                break;
        }
        return self;
    };
}

- (void)labRectCornerWith:(NSString *)strNum radius:(CGFloat )radius{
    
    UIBezierPath *maskPath;
    if (strNum.intValue == 0) {
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    }else if (strNum.intValue == 1){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(radius, radius)];
    }else if (strNum.intValue == 2){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(radius, radius)];
    }else if (strNum.intValue == 3){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft |UIRectCornerBottomLeft cornerRadii:CGSizeMake(radius, radius)];
    }else if (strNum.intValue == 4){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
    }else if (strNum.intValue == 5){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
    }else if (strNum.intValue == 6){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopRight |UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
    }
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//-(CJLabel *)pp_make:(void (^)(CJLabel *cjlabel))make
//{
//    CJLabel *m = self;
//    if (!m) { return nil; }
//    if (make) { make(m);}
//    return self;
//}
//
//-(CJLabel *(^)(CGRect))frame
//{
//    return ^CJLabel *(CGRect frame){
//        self.frame = frame;
//        return self;
//    };
//}
//
//#pragma mark --- 背景色
//-(CJLabel *(^)(UIColor *))bgColor
//{
//    return ^CJLabel *(UIColor *color){
//        self.backgroundColor = color;
//        return self;
//    };
//
//
//}



//- (void)setText:(NSString *)text
//{
//    BOOL hasColor = [text rangeOfString:@"<"].location != NSNotFound;
//    BOOL hasFont = [text rangeOfString:@"["].location != NSNotFound;
//
//    if ( hasColor && hasFont) {
//        [self setColorFontText:text];
//    }else if( hasColor && (!hasFont)){
//        [self setColorText:text];
//    }else if ((!hasColor) && hasFont){
//        [self setFontText:text];
//    }
//    return;
//}

- (CJLabel *(^)(UIFont* antherFont))labAntherFont{
    
    return ^(UIFont* antherFont){
       self.anotherFont = antherFont;
        return self;
    };
}

- (CJLabel *(^)(UIColor *anotherColor))labAnotherColor{
    return^(UIColor *anotherColor){
        self.anotherColor = anotherColor;
        return self;
    };
}


- (CJLabel *(^)(NSString *text))labAnotherTest{
    
    return ^(NSString *text){
        [self setAnotherTest:text];
        return self;
    };
}

#pragma mark ----------设置富文本

- (void)setAnotherTest:(NSString *)text{
    BOOL hasColor = [text rangeOfString:@"<"].location != NSNotFound;
    BOOL hasFont = [text rangeOfString:@"["].location != NSNotFound;
    
    if ( hasColor && hasFont) {
        [self setColorFontText:text];
    }else if( hasColor && (!hasFont)){
        [self setColorText:text];
    }else if ((!hasColor) && hasFont){
        [self setFontText:text];
    }
    return;
    
}


- (void)setColorText:(NSString *)text{
    if ([text rangeOfString:@"<"].location != NSNotFound){
        if (!CJColorLabelAnotherColor) {
            CJColorLabelAnotherColor = [UIColor redColor];
        }
        NSMutableString *mstr = [NSMutableString string];
        [mstr appendString:text];
        NSArray *rangeColorArray = [self scanBeginStr:@"<" endStr:@">" inText:&mstr];
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:mstr];
        AttributedStr = [self addAttributeString:AttributedStr withArray:rangeColorArray type:1];
        [self setAttributedText:AttributedStr];
    }else{
        [self setText:text];
    }
}

- (void)setFontText:(NSString *)text{
    if ([text rangeOfString:@"["].location != NSNotFound) {
        if (!CJColorLabelAnotherFont) {
            CJColorLabelAnotherFont = [UIFont cjTitleFont14];
        }
        NSMutableString *mstr2 = [NSMutableString string];
        [mstr2 appendString:text];
        NSArray *rangeBoldArray = [self scanBeginStr:@"[" endStr:@"]" inText:&mstr2];
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:mstr2];
        AttributedStr = [self addAttributeString:AttributedStr withArray:rangeBoldArray type:2];
        [self setAttributedText:AttributedStr];
    }else{
        [self setText:text];
    }
}

- (void)setColorFontText:(NSString *)text{
    if (([text rangeOfString:@"<"].location != NSNotFound)||([text rangeOfString:@"["].location != NSNotFound)) {
        if (!CJColorLabelAnotherFont) {
            CJColorLabelAnotherFont = [UIFont cjTitleFont14];
        }
        if (!CJColorLabelAnotherColor) {
            CJColorLabelAnotherColor = [UIColor cjMainTextColor];
        }
        NSMutableString *mstr = [NSMutableString string];
        NSMutableString *mstr2 = [NSMutableString string];
        [mstr appendString:text];
        [mstr2 appendString:text];
        [mstr replaceOccurrencesOfString:@"[" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mstr.length)];
        [mstr replaceOccurrencesOfString:@"]" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mstr.length)];
        [mstr2 replaceOccurrencesOfString:@"<" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mstr2.length)];
        [mstr2 replaceOccurrencesOfString:@">" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mstr2.length)];
        NSArray *rangeColorArray = [self scanBeginStr:@"<" endStr:@">" inText:&mstr];
        NSArray *rangeBoldArray = [self scanBeginStr:@"[" endStr:@"]" inText:&mstr2];
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:mstr];
        AttributedStr = [self addAttributeString:AttributedStr withArray:rangeColorArray type:1];
        AttributedStr = [self addAttributeString:AttributedStr withArray:rangeBoldArray type:2];
        [self setAttributedText:AttributedStr];
    }else{
        [self setText:text];
    }
}

/**
 *  通过传入的开始标记和结束标记在这个字符串中扫描并将获得的范围装在数组中返回
 *
 *  @param beginstr 开始标记
 *  @param endstr   结束标记
 *  @param text     信息
 *
 *  @return 字典数组装着一个个range
 */
- (NSArray *)scanBeginStr:(NSString *)beginstr endStr:(NSString *)endstr inText:(NSMutableString * *)text{
    NSRange range1;
    NSRange range2;
    NSUInteger location =0;
    NSUInteger length = 0;
    range1.location = 0;
    
    NSMutableString *mstr2 = *text;
    NSMutableArray *rangeBoldArray = [NSMutableArray array];
    while (range1.location != NSNotFound) {
        range1 = [mstr2 rangeOfString:beginstr];
        range2 = [mstr2 rangeOfString:endstr];
        if (range1.location != NSNotFound) {
            location = range1.location;
            length = range2.location - range1.location-1;
            if (length > 5000)break;
            
            [mstr2 replaceOccurrencesOfString:beginstr withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, range1.location + range1.length)];
            [mstr2 replaceOccurrencesOfString:endstr withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, range2.location + range2.length - 1)];
        }
        NSDictionary *dict = @{@"location":@(location),@"length":@(length)};
        [rangeBoldArray addObject:dict];
    }
    return rangeBoldArray;
}

/**
 *  通过传入的range数组在富文本中添加特殊文本，有两种类型
 *
 *  @param attributeStr 富文本
 *  @param dictArray    字典数组里面装着range
 *  @param type         1就是添加颜色相关，2就是添加字体相关
 *
 *  @return 把传入的富文本返回
 */
- (NSMutableAttributedString *)addAttributeString:(NSMutableAttributedString *)attributeStr withArray:(NSArray *)dictArray type:(CJLabelType)type{
    
    UIFont *showFont = self.anotherFont == nil ? CJColorLabelAnotherFont : self.anotherFont;
    NSString *key = type == CJLabelTypeColor ? NSForegroundColorAttributeName : NSFontAttributeName;
    UIColor *showColor = self.anotherColor == nil ? CJColorLabelAnotherColor : self.anotherColor;
    NSObject *value = type == CJLabelTypeColor ? showColor : showFont;
    
    for (NSDictionary *dict in dictArray) {
        NSUInteger lo = [dict[@"location"] integerValue];
        NSUInteger le = [dict[@"length"] integerValue];
        [attributeStr addAttribute:key
                             value:value
                             range:NSMakeRange(lo, le)];
    }
    return attributeStr;
}

+ (void)setAnotherColor:(UIColor *)color
{
    CJColorLabelAnotherColor = color;
}

+ (void)setAnotherFont:(UIFont *)font
{
    CJColorLabelAnotherFont = font;
}

- (void)setAnotherColor:(UIColor *)color{
    _anotherColor = color;
}
- (void)setAnotherFont:(UIFont *)font{
    _anotherFont = font;
}
@end
