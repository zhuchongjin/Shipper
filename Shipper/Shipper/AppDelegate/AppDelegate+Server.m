//
//  AppDelegate+Server.m
//  TMSDriver
//
//  Created by mac on 2019/1/17.
//  Copyright © 2019年 admin All rights reserved.
//

#import "AppDelegate+Server.h"
#import <Bugly/Bugly.h>
#import "RootViewController.h"
#import "IQKeyboardManager.h"

@interface AppDelegate()<BuglyDelegate >
@end
@implementation AppDelegate (Server)

#pragma mark ----------设置根视图和一些 其他配置
- (void)setRootVCAndOtherConfiguration{
    
    [self setRootViewController];
    [IQKeyboardManager sharedManager].toolbarDoneBarButtonItemText = @"完成";
    // 设置bug统计
    [self setBuglyConfig];
    //设置 setShortcutItems
    [self setShortcutItems];

#ifdef DEBUG


#else
    // Release 模式的代码...
#endif
    
#ifdef IsDebugDevelopmentModel
    
    DLog(@"----------------IsDebugDevelopmentModel");
    
#else
    
    DLog(@"----------------");
#endif
    
}


#pragma mark ----------Bugly统计
- (void)setBuglyConfig{
    // bug 崩溃统计分析
    BuglyConfig *config = [[BuglyConfig alloc] init];
    config.unexpectedTerminatingDetectionEnable = YES; //非正常退出事件记录开关，默认关闭
    config.reportLogLevel = BuglyLogLevelWarn; //报告级别
    config.deviceIdentifier = [UIDevice currentDevice].identifierForVendor.UUIDString; //设备标识
    config.blockMonitorEnable = YES; //开启卡顿监控
    config.blockMonitorTimeout = 2.5; //卡顿监控判断间隔，单位为秒
    config.delegate = self;
    [Bugly startWithAppId:@"e6b42c9949"];
}
//#pragma mark - BuglyDelegate
//此方法返回的数据，可在bugly平台中异常上报，具体异常信息的跟踪数据附件信息中的crash_attach.log中查看
-(NSString *)attachmentForException:(NSException *)exception{
    
    //    [Bugly reportException:exception];
    return [NSString stringWithFormat:@"exceptionInfo:\nname:%@\nreason:%@",exception.name,exception.reason];
}

#pragma mark ----------设置rootvc
- (void)setRootViewController{
    

    
//    if ([self isFirstOpen]) {
//
//        JMGuidViewController *gdView = [[JMGuidViewController alloc] init];
//        self.window.rootViewController = gdView;
//        [self.window makeKeyAndVisible];
//    }
//    else{
        RootViewController *tabBarCtrl = [[RootViewController alloc]init];
        self.window.rootViewController = tabBarCtrl;
        [self.window makeKeyAndVisible];
//    }

}

#pragma mark ----------设置ShortcutItems
- (void)setShortcutItems{
    
//    NSMutableArray *shortCutItemArr = [NSMutableArray arrayWithCapacity:4];
//    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd]; //iconWithTemplateImageName
//    UIApplicationShortcutItem *shortItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"Shipper-SendGoods" localizedTitle:@"下单" localizedSubtitle:@"快速下订单" icon:icon1 userInfo:nil];
//    [shortCutItemArr addObject:shortItem1];
//
//    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose]; // UIApplicationShortcutIconTypeCompose
//    UIApplicationShortcutItem *shortItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"Shipper-OrderList" localizedTitle:@"运单" localizedSubtitle:@"快速查看运单" icon:icon2 userInfo:nil];
//    [shortCutItemArr addObject:shortItem2];
//    [UIApplication sharedApplication].shortcutItems = shortCutItemArr;
    
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
       NSLog(@"name:%@\ntype:%@", shortcutItem.localizedTitle, shortcutItem.type);
    
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    UITabBarController *tabViewController = (UITabBarController *) appDelegate.window.rootViewController;
//
//    if ([shortcutItem.type isEqualToString:@"Shipper-SendGoods"]) {
//
//        [tabViewController setSelectedIndex:0];
//
//        SendGoodsVC *vc = [[SendGoodsVC alloc]init];
//        if (vc.hidesBottomBarWhenPushed == NO) {
//            vc.hidesBottomBarWhenPushed = YES;
//        }
//        [[CJControl getCurrentViewController].navigationController pushViewController:vc animated:YES];
//
//    }else if ([shortcutItem.type isEqualToString:@"Shipper-OrderList"]){
//        [tabViewController setSelectedIndex:1];
//    }
}

#pragma mark ----------判断是否第一次启动
- (BOOL)isFirstOpen {
    
    BOOL coachMarksShown = [[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstShown"];
    if (coachMarksShown == NO) {
        // Don't show again
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstShown"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
    else{
        return NO;
    }
}






@end
