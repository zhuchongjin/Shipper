//
//  CJAlert.m
//  TMSDriver
//
//  Created by mac on 2019/1/22.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "CJAlert.h"
#import "UIImage+GIFImage.h"
#import "SVProgressHUD_Extension.h"
@interface CJAlert()
@property (nonatomic,copy) NextStepBlock nextStepBlock;
@end

@implementation CJAlert


+ (CJAlert *)shared {
    
    static dispatch_once_t predicate;
    
    static CJAlert *objc;
    
    dispatch_once(&predicate, ^{
        
        objc = [[CJAlert alloc] init];
        
    });
    
    return objc;
}

+ (void)showStringDismissWithDelay:(NSString *)str{
    
    /*
       SVProgressHUDStyleLight,        // 白色半透明背景，字体黑色
       SVProgressHUDStyleDark,         // 黑色背景，字体白色
       SVProgressHUDStyleCustom        // 白色背景，字体黑色
    */
    
    [SVProgressHUD dismiss];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@""]];   //取不到就不显示图片了，不要[UIImage new]，new的话会有个空白
    [SVProgressHUD showInfoWithStatus:str];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    // 其他页面是否可点击属性等
    [SVProgressHUD setDefaultAnimationType:(SVProgressHUDAnimationTypeFlat)];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];

    NSTimeInterval interval = 1.5;
    
    if (str.length < 8) {
        interval = 1.5;
    }else if(str.length >= 8 && str.length < 20){
        interval = 2.5;
    }else{
        interval = 4;
    }
    [SVProgressHUD dismissWithDelay:interval];
    
}
+ (void)showLoading{
    
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//    [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
//    [SVProgressHUD setMinimumDismissTimeInterval:CGFLOAT_MAX];
//    [SVProgressHUD setInfoImage:[UIImage imageWithGIFNamed:@"loading"]];
//    [SVProgressHUD setImageViewSize:CGSizeMake(64, 48)];

//    [SVProgressHUD showInfoWithStatus:@"加载中。。。"];
    [SVProgressHUD showWithStatus:@"加载中...."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];

}


void ShowMessage(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [CJAlert showStringDismissWithDelay:statues];

        });
    }else{
        [CJAlert showStringDismissWithDelay:statues];
    }
}

+ (void)dismiss{
    [SVProgressHUD dismiss];
}

//static CJAlert* _instance = nil;
//
//+(instancetype) shareInstance
//{
//    static dispatch_once_t onceToken ;
//    dispatch_once(&onceToken, ^{
//        _instance = [[self alloc] init] ;
//    }) ;
//
//    return _instance ;
//}

/// 加载提示  执行操作
/// @param str <#str description#>
/// @param nextStep <#nextStep description#>
- (void)showStringTitle:(NSString *)str nextStep:(NextStepBlock )nextStep{
    
    [CJAlert showStringDismissWithDelay:str];
    self.nextStepBlock = nextStep;
    @weakify(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self);
        if (self.nextStepBlock) {
            self.nextStepBlock(@"");
        }
    });
}


@end

