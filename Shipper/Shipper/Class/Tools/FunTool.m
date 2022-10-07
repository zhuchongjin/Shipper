//
//  FunTool.m
//  Shipper
//
//  Created by admin on 2022/9/30.
//  Copyright © 2022 admin. All rights reserved.
//

#import "FunTool.h"
#import "GTMBase64.h"
#import <CommonCrypto/CommonDigest.h>
@implementation FunTool


/// 货物当前控制器
+ (UIViewController *)getCurrentViewController{

    UIViewController* currentViewController = [FunTool getRootViewController];
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        
        if (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
        } else if ([currentViewController isKindOfClass:[UINavigationController class]]) {

          UINavigationController* navigationController = (UINavigationController* )currentViewController;
            currentViewController = [navigationController.childViewControllers lastObject];

        } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {

          UITabBarController* tabBarController = (UITabBarController* )currentViewController;
            currentViewController = tabBarController.selectedViewController;
        } else {

            NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
            if (childViewControllerCount > 0) {
                currentViewController = currentViewController.childViewControllers.lastObject;
                return currentViewController;
            } else {
                return currentViewController;
            }
        }
    }
    return currentViewController;
}

+ (UIViewController *)getRootViewController{

    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    NSAssert(window, @"The window is empty");
    return window.rootViewController;
}

@end
