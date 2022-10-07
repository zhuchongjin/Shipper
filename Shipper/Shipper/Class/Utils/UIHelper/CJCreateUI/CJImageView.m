//
//  CJImageView.m
//  CJUIFactory
//
//  Created by mac on 2019/4/15.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "CJImageView.h"

@implementation CJImageView

+ (CJImageView *)imgInit {
    
    CJImageView *imgView = [[CJImageView alloc] initWithFrame:CGRectZero];

//    imgView.contentMode= UIViewContentModeScaleAspectFill;
    
    imgView.clipsToBounds = YES;
    
    return imgView;
    
}

- (CJImageView *(^)(CGRect frame))imgVFrame{
    
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (CJImageView *(^)(NSString *imgName))imgVImageName{
    
    return ^(NSString *imgName){
//        self.image = UIImageNamed(imgName);
        self.image = [UIImage imageNamed:imgName];
        return self;
        
    };
}

- (CJImageView *(^)(UIColor *color))imgVbgColor{
    
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}


- (CJImageView *(^)(UIViewContentMode contentMode))imgVContentMode{
    
    return ^(UIViewContentMode contentMode){
        self.contentMode= contentMode;
        return self;
    };
}

- (CJImageView *(^)(CGFloat cornerRadius))imgVCornerRadius{
    
    return ^(CGFloat cornerRadius){
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}


//- (CJImageView *(^)(BOOL cutRound))imgVWheatherCutRound{
//    return  ^(BOOL cutRound){
//
//        if (cutRound) {
//            UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1.0);
//            [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.frame.size.width] addClip];
//            [self drawRect:self.bounds];
//            self.image = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
//        }
//        return self;
//    };
//
//}


@end
