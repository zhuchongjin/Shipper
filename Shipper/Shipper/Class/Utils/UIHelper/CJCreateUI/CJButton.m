//
//  CJButton.m
//  CJUIFactory
//
//  Created by mac on 2019/4/12.
//  Copyright © 2019年 zcj. All rights reserved.
//

#import "CJButton.h"
#import <sys/utsname.h>

@interface CJButton()
@property(nonatomic,assign)CJImageAlignment imageAlignment;
@property(nonatomic,assign)CGFloat spaceBetweenTitleAndImage;

@end

@implementation CJButton

+ (CJButton *)btnInit{
    
    CJButton *btn = [CJButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont cjTitleFont14];
    btn.clipsToBounds = YES;
    btn.layer.masksToBounds = YES;
    return btn;
}

- (CJButton *(^)(CGRect frame))btnFrame{
    
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (CJButton *(^)(UIColor *color))btnBgColor{
    
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (CJButton *(^)(NSString *text))btnText{
    
    return ^(NSString *text){
        [self setTitle:text forState:UIControlStateNormal];
        return self;
    };
}

- (CJButton *(^)(NSString *text))btnSelectText{
    return ^(NSString *text){
        [self setTitle:text forState:UIControlStateSelected];
        return self;
    };
}

- (CJButton *(^)(CGFloat size))btnFontSize{
    return ^(CGFloat size){
        self.titleLabel.font = [UIFont cjTitleFontX:size];
        return self;
    };
}
- (CJButton *(^)(UIFont *textFont))btnFont{
    return ^(UIFont *textFont){
        self.titleLabel.font = textFont;
        return self;
    };
}

- (CJButton *(^)(UIColor *normalTitleColor))btnNormalTitleColor{
    
    return ^(UIColor *normalTitleColor){
        [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
        return self;
    };
    
}
- (CJButton *(^)(NSInteger tag))btnSetTag{
   
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

- (CJButton *(^)(UIColor *selectTitleColor))btnSelectTitleColor{
    
    return ^(UIColor *selectTitleColor){
        [self setTitleColor:selectTitleColor forState:UIControlStateSelected];
        return self;
    };
}

- (CJButton *(^)(NSString *imageName))btnBgImg{
    
    return ^(NSString *imageName){
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}


- (CJButton *(^)(NSString *normalImageName))btnNormalImgName {
    
    return ^(NSString *normalImageName){
        [self setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
        return self;
    };
}


- (CJButton *(^)(NSString *highlightImageName))btnHighlightImgName {
    
    return ^(NSString *highlightImageName) {
        
        [self setImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateNormal];
        return self;
    };
    
}



- (CJButton *(^)(NSString *selectImageName))btnSelectImgName {
    
    return  ^(NSString *selectImageName) {
        
        [self setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
        return self;
    };
}




- (CJButton *(^)(id target,SEL sel))btnTargetAction {
    
    return  ^(id target,SEL sel) {
        
        [self addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
        return self;
    };

}


- (CJButton *(^)(CGFloat radius))btnCornerRadius{
    
    return ^(CGFloat radius) {
        
        self.layer.cornerRadius = radius;
        return self;
        
    };
}


// 设置圆角边线的颜色
- (CJButton *(^)(UIColor *color))btnCornerColor {
    
   return ^(UIColor *color) {
        
        self.layer.borderColor = color.CGColor;
        
        return self;
        
    };
    
}


// 设置圆角边线的宽度
- (CJButton *(^)(CGFloat width))btnCornerWidth {
    
    return^(CGFloat width) {
        
        self.layer.borderWidth = width;
        return self;
    };
}

- (CJButton *(^)(NSTextAlignment aligment))btnTextAligmentAndLineNums{
    
    return ^(NSTextAlignment aligment){
        [self.titleLabel setNumberOfLines:0];
        [self.titleLabel setTextAlignment:aligment];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        return self;
    };
}

- (CJButton *(^)(CJImageAlignment imageAlignment))btnImgAlignment{
    
    return ^(CJImageAlignment imageAlignment){
        self.imageAlignment = imageAlignment;
        return self;
    };
}

- (CJButton *(^)(CGFloat spaceBetweenTitleAndImage))btnSpaceBetweenTitleAndImage{
    return ^(CGFloat spaceBetweenTitleAndImage){
        self.spaceBetweenTitleAndImage = spaceBetweenTitleAndImage;
        return self;
    };
}



- (CJButton *(^)(UIControlContentHorizontalAlignment btnTitleHorizontalAlignment)) btnTitleHorizontalAlignment{
    
    return ^(UIControlContentHorizontalAlignment btnTitleHorizontalAlignment){
        self.contentHorizontalAlignment = btnTitleHorizontalAlignment;
        self.titleLabel.numberOfLines = 0;
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        return self;
    };
}


- (CJButton *(^)(CJButtonRectCorner btnCorner ,CGFloat radius ))btnRectCornerRadius{
    
    return ^(CJButtonRectCorner btnCorner ,CGFloat radius ){
        
        switch (btnCorner)
        {
               
            case CJButtonRectCornerAll:
                [self btnRectCornerWith:@"0" radius:radius];
                break;
            case CJButtonRectCornerLeftTop:
                [self btnRectCornerWith:@"1" radius:radius];
                break;
            case CJButtonRectCornerLeftBottom:
                [self btnRectCornerWith:@"2" radius:radius];
                break;
            case CJButtonRectCornerLeftTopBottom:
                [self btnRectCornerWith:@"3" radius:radius];
                break;
            case CJButtonRectCornerRightTop:
                [self btnRectCornerWith:@"4" radius:radius];
                break;
            case CJButtonRectCornerRightBottom:
                 [self btnRectCornerWith:@"5" radius:radius];
                break;
            case CJButtonRectCornerRightTopBottom:
                 [self btnRectCornerWith:@"6" radius:radius];
                break;
        }
        return self;
    };
}


- (void)btnRectCornerWith:(NSString *)strNum radius:(CGFloat )radius{
 
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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat space = self.spaceBetweenTitleAndImage;
    
    
    CGFloat titleW = CGRectGetWidth(self.titleLabel.bounds);//titleLabel的宽度
    CGFloat titleH = CGRectGetHeight(self.titleLabel.bounds);//titleLabel的高度
    
    CGFloat imageW = CGRectGetWidth(self.imageView.bounds);//imageView的宽度
    CGFloat imageH = CGRectGetHeight(self.imageView.bounds);//imageView的高度
    
    CGFloat btnCenterX = CGRectGetWidth(self.bounds)/2;//按钮中心点X的坐标（以按钮左上角为原点的坐标系）
    CGFloat imageCenterX = btnCenterX - titleW/2;//imageView中心点X的坐标（以按钮左上角为原点的坐标系）
    CGFloat titleCenterX = btnCenterX + imageW/2;//titleLabel中心点X的坐标（以按钮左上角为原点的坐标系）
    
    
    switch (self.imageAlignment)
    {
        case CJImageAlignmentTop:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(imageH/2+ space/2, -(titleCenterX-btnCenterX), -(imageH/2 + space/2), titleCenterX-btnCenterX);
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleH/2 + space/2), btnCenterX-imageCenterX, titleH/2+ space/2, -(btnCenterX-imageCenterX));
        }
            break;
        case CJImageAlignmentLeft:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0,  -space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space);
        }
            break;
        case CJImageAlignmentBottom:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(-(imageH/2+ space/2), -(titleCenterX-btnCenterX), imageH/2 + space/2, titleCenterX-btnCenterX);
            self.imageEdgeInsets = UIEdgeInsetsMake(titleH/2 + space/2, btnCenterX-imageCenterX,-(titleH/2+ space/2), -(btnCenterX-imageCenterX));
        }
            break;
        case CJImageAlignmentRight:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageW + space/2), 0, imageW + space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW+space/2, 0, -(titleW+space/2));
        }
            break;
        default:
            break;
    }
}



@end
