//
//  AppDelegate.m
//  TMSDriver
//
//  Created by admin on 2018/3/6.
//  Copyright © 2018年 admin All rights reserved.
//

#import "AppDelegate.h"
#import <WZLBadge/WZLBadgeImport.h>
#import "CJCheckVersion.h"
#import "AppDelegate+Server.h"
/**  极光  **/
#import "JPUSHService.h"
// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
// 如果需要使用 idfa 功能所需要引入的头文件（可选）
#import <AdSupport/AdSupport.h>
@interface AppDelegate ()<JPUSHRegisterDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    
    [self setRootVCAndOtherConfiguration];
    [self jPush:launchOptions];
    
    return YES;
}



- (void)jPush:(NSDictionary *)launchOptions {
    
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    // 3.0.0及以后版本注册可以这样写，也可以继续用旧的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        ////          可以添加自定义categories
        //              if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        //                NSSet<UNNotificationCategory *> *categories;
        //                entity.categories = categories;
        //              }
        //              else {
        //                NSSet<UIUserNotificationCategory *> *categories;
        //                entity.categories = categories;
        //              }
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    //如不需要使用IDFA，advertisingIdentifier 可为nil com.apa.com.DeZouzhShipperNew
    [JPUSHService setupWithOption:launchOptions appKey:JPushKey
                          channel:@"Publish channel"
                 apsForProduction:YES
            advertisingIdentifier:advertisingId];
    
    //2.1.9版本新增获取registration id block接口。15192934240
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if(resCode == 0){
            DLog(@"registrationID获取成功：%@",registrationID);
            
//                           [JPUSHService setAlias:getCode completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
//                                DLog(@"Alias number %ld",seq);
//                           } seq:101];
//                           NSSet * set2 = [[NSSet alloc] initWithObjects:branchCode, nil];
//                           [JPUSHService setTags:set2 completion:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
//                                 DLog(@"Tag number %ld",seq);
//
//                           } seq:102];
        }
        else{
            DLog(@"registrationID获取失败，code：%d",resCode);
        }
    }];
    
    
    //自定义消息
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    
    
    //设置红色角标
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [JPUSHService setBadge:0];
    
    
}

- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    DLog(@"userInfo%@ and content %@",userInfo,[userInfo valueForKey:@"content"]);
//    NSString *content = [userInfo valueForKey:@"content"];
//    NSDictionary *extras = [userInfo valueForKey:@"extras"];
    
//    NSString *key = [extras objectForKey:@"key"];
    //  判断key的值   如果是1001新推的单子。1006.派的单子。存起来，播报  1003，让删除订单
    
//
//    if (key.integerValue == 2005)
//    {
//        DLog(@"Notice push received");
//
//
//
//    }else if (key.integerValue == 2001){
//
//
//
//    }
    
    
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 10;
//    [JPUSHService setBadge:10];
    
//    CJSendNotify(CJJpushOrder, nil);
    
    DLog(@"===============收到推送")
}
//注册APNs成功并上报DeviceToken
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}
//实现注册APNs失败接口
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    DLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:
(UIUserNotificationSettings *)notificationSettings {
}
// Called when your app has been activated by the user selecting an action from
// a local notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling
// the action.
- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(UILocalNotification *)notification
  completionHandler:(void (^)(void))completionHandler {
}

// Called when your app has been activated by the user selecting an action from
// a remote notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling
// the action.
- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forRemoteNotification:(NSDictionary *)userInfo
  completionHandler:(void (^)(void))completionHandler {
}
#endif

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [JPUSHService handleRemoteNotification:userInfo];
    DLog(@"iOS6及以下系统，收到通知:%@", userInfo);
    //     [rootViewController addNotificationCount];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    DLog(@"iOS7及以上系统，收到通知:%@", userInfo);
    
    if ([[UIDevice currentDevice].systemVersion floatValue]<10.0 || application.applicationState>0) {
        //          [rootViewController addNotificationCount];
    }
    
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification {
    [JPUSHService showLocalNotificationAtFront:notification identifierKey:nil];
}

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#pragma mark- JPUSHRegisterDelegate


/// 在前台收到消息
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    UNNotificationRequest *request = notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        DLog(@"iOS10 前台收到远程通知:%@", userInfo);

        
//        [self mastePushViewController:userInfo];
//        [self saveLoacalData:userInfo];
//        if (IsNilOrNull(userInfo[@"isSystem"])) {
//
//       }else{
//
////             NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//             if ([userInfo[@"isSystem"] integerValue] == 1 || IsNilOrNull(userInfo[@"type"])) {
//                 //系统消息
//
//             } else{
////                 UITabBarController *tabViewController = (UITabBarController *) self.window.rootViewController;
////                     [[tabViewController.viewControllers objectAtIndex:1].tabBarItem showBadgeWithStyle:WBadgeStyleRedDot value:0 animationType:WBadgeAnimTypeNone];
//
//                 DispatchListVC *vc = [DispatchListVC new];
////                 [[CJControl getCurrentViewController] pushVc:vc];
//                 if (vc.hidesBottomBarWhenPushed == NO) {
//                     vc.hidesBottomBarWhenPushed = YES;
//                 }
//                 [[CJControl getCurrentViewController].navigationController pushViewController:vc animated:NO];
//             }
//
//         }
         
    }
    else {
        // 判断为本地通知
        DLog(@"iOS10 前台收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
    }
    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
    
    DLog(@"===============收到推送")

}

//  APP 外点进入调用的方法
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    UNNotificationRequest *request = response.notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    DLog(@"===============收到推送")

    
    if (@available(iOS 10.0, *)) {
        if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            [JPUSHService handleRemoteNotification:userInfo];
            DLog(@"iOS10 收到远程通知:%@", userInfo);
            //                         [rootViewController addNotificationCount];
//            [self mastePushViewController:userInfo];
            [self mastePushViewController:userInfo];
//            [self saveLoacalData:userInfo];

        }
        else {
            // 判断为本地通知
            DLog(@"iOS10 收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
        }
    } else {
        // Fallback on earlier versions
    }
    
    completionHandler();  // 系统要求执行这个方法
}
#endif



//push方法
- (void)mastePushViewController:(NSDictionary *)userInfo {
    /*
     在这里我们需要进行跳转到指定页面的处理。那么就有一个问题，我们的项目工程里有的页面是presented出来的，那么久无法进行push。那么这里我们就要进行找topVC,并且这个topVC是需要我们进行处理的，是需要具有导航的（navigationController）。
     */

    
    if (IsNilOrNull(userInfo[@"isSystem"])) {
         
   }else{
       
//             NSMutableDictionary *dict = [NSMutableDictionary dictionary];
         if ([userInfo[@"isSystem"] integerValue] == 1 || IsNilOrNull(userInfo[@"type"])) {
             //系统消息

         } else{

         }

     }
    

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    //版本检测
//    [self checkUpdate];
}




- (void)comeHome:(UIApplication *)application {
    NSLog(@"进入后台");
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [JPUSHService setBadge:0];
    [[CJCheckVersion shareCheckVersion]checkVersion];
}


@end



