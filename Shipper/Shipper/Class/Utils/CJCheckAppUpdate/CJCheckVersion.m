//
//  CJCheckVersion.m
//  PengYuanDeShipper
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import "CJCheckVersion.h"
#import "CJAppInfo.h"
#import <AFNetworking.h>

static NSString * const skipVersionKey = @"CJAppUpdateVersionKey";
@interface CJCheckVersion ()<UIAlertViewDelegate>
/** appstore上的版本号 */
@property (nonatomic ,copy) NSString *storeVersion;
@property (nonatomic,copy) NSString *trackId;
@end

@implementation CJCheckVersion

static CJCheckVersion *_checkVersion = nil;
+ (instancetype)shareCheckVersion{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _checkVersion = [CJCheckVersion alloc];
    });
    return _checkVersion;
}

- (void)checkVersion{
    
    WS(ws);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[CJAppInfo appUrlInItunes] parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        DLog(@"%@",responseObject);
        //请求成功？
        if (((NSArray *)responseObject[@"results"]).count<=0) {
            return;
        }

        // 获取trackId
        ws.trackId = [(NSArray *)responseObject[@"results"] firstObject][@"trackId"];
//        DLog(@"trackId ==== %@",self.trackId);
        //获取appstore版本号和提示信息
        ws.storeVersion = [(NSArray *)responseObject[@"results"] firstObject][@"version"];
        NSString *releaseNotes = [(NSArray *)responseObject[@"results"] firstObject][@"releaseNotes"];
        //获取跳过的版本号
        NSString *skipVersion = [[NSUserDefaults standardUserDefaults] valueForKey:skipVersionKey];
        //比较版本号
        DLog(@"%@--%@",self.storeVersion,skipVersion);
        if ([ws.storeVersion isEqualToString:skipVersion]) {//如果store和跳过的版本相同
            return;
        }else{
            [ws compareCurrentVersion:[CJAppInfo appVersion] withAppStoreVersion:self.storeVersion updateMsg:releaseNotes];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/// 手机版本和商店上进行比较
/// @param currentVersion <#currentVersion description#>
/// @param appStoreVersion <#appStoreVersion description#>
/// @param updateMsg  更新内容
- (void)compareCurrentVersion:(NSString *)currentVersion withAppStoreVersion:(NSString *)appStoreVersion updateMsg:(NSString *)updateMsg{

    NSMutableArray *currentVersionArr = [[currentVersion componentsSeparatedByString:@"."] mutableCopy];
    NSMutableArray *appStoreVersionArr = [[appStoreVersion componentsSeparatedByString:@"."] mutableCopy];
    if (!currentVersionArr.count ||!appStoreVersionArr.count){
        return;
    }
   
    int mendCount = abs((int)(currentVersionArr.count - appStoreVersionArr.count));
    
    // 补全 3位版本号 不足 补0
    if (currentVersionArr.count > appStoreVersionArr.count) {
        for (int index = 0; index < mendCount; index ++) {
            [appStoreVersionArr addObject:@"0"];
        }
    } else if (currentVersionArr.count < appStoreVersionArr.count) {
        for (int index = 0; index < mendCount; index ++) {
            [currentVersionArr addObject:@"0"];
        }
    }
    //强制更新
    if ([currentVersionArr.firstObject integerValue] < [appStoreVersionArr.firstObject integerValue]) {
        
        [self showUpdateAlertMust:YES toskip:YES withStoreVersion:appStoreVersion message:updateMsg];
    }else{
        
        NSInteger comparingResults = [currentVersion compare:appStoreVersion options:NSCaseInsensitiveSearch];
        if (comparingResults == NSOrderedDescending){
            NSLog(@"当前版本比商店版本高");
            return;
        }
        //提示更新
        for (int index = 0; index<currentVersionArr.count; index++) {
            
            if ([currentVersionArr[index] integerValue] < [appStoreVersionArr[index] integerValue]) {
                [self showUpdateAlertMust:NO toskip: index == 1 ? NO:YES withStoreVersion:appStoreVersion message:updateMsg];
                return;
            }
        }
    }
}


/// <#Description#>
/// @param must <#must description#>
/// @param skip <#skip description#>
/// @param storeVersion <#storeVersion description#>
/// @param message <#message description#>
- (void)showUpdateAlertMust:(BOOL)must toskip:(BOOL)skip withStoreVersion:(NSString *)storeVersion message:(NSString *)message{
   
    NSString *title = [NSString stringWithFormat:@"最新版本:%@",storeVersion];
    WS(ws);
    if (must) {

        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *updateAct = [UIAlertAction actionWithTitle:@"立即更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [ws openAppStoreToUpdate];
        }];
        [alertC addAction:updateAct];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertC animated:YES completion:^{
            
        }];

    }else{
       
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *nextTimeAction = [UIAlertAction actionWithTitle:@"下次再说" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            DLog(@"点击了下次再说");
        }];
        [alertC addAction:nextTimeAction];


        if (skip) {
            UIAlertAction *skipAction = [UIAlertAction actionWithTitle:@"跳过此版" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //            DLog(@"点击了跳过");
                [[NSUserDefaults standardUserDefaults] setObject:storeVersion forKey:skipVersionKey];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }];
            [alertC addAction:skipAction];
        }
        
        UIAlertAction *updateAction = [UIAlertAction actionWithTitle:@"立即更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            DLog(@"点击了立即更新");
            [ws openAppStoreToUpdate];
        }];
        [alertC addAction:updateAction];

        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertC animated:YES completion:^{
        }];
       
    }

}


/// 下载
- (void)openAppStoreToUpdate{
    
//    NSURL *trackUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/apple-store/id%@",self.trackId]];
    NSURL *trackUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@",self.trackId]];
    
    if ([[UIApplication sharedApplication] canOpenURL:trackUrl]) {
        [[UIApplication sharedApplication] openURL:trackUrl];
    }
}

// 跳转到详情
// 推荐 方法1、3、5。
////1、cn代表中国。在Safari浏览器打开链接是中文介绍
//NSString *urlStr = [NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@", APPID];
//
////2、us代表美国。在Safari浏览器打开链接是英文介绍
//NSString *urlStr = [NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@", APPID];
//
////3、和1跳转相同
//NSString *urlStr = [NSString stringWithFormat:@"https://itunes.apple.com/cn/app/apple-store/id%@", APPID];
//
////4、和2跳转相同
//NSString *urlStr = [NSString stringWithFormat:@"https://itunes.apple.com/app/id%@", APPID];
//
////5、以 itms-apps:// 或 https:// 开头的应用详情页链接，跳转到AppStore
//NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@", APPID];
//
////6、以 itms:// 开头的应用详情页连接，会跳转到 iTunes Store，打开的仍然是应用的下载页
//NSString *urlStr = [NSString stringWithFormat:@"itms://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@", APPID];
//
////打开链接地址
//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];



//跳转到应用评分页
// 推荐  方法1、2、3。
////1、itms-apps:// 开头
//NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",APPID];
//
////2、itms:// 开头
//NSString *urlStr = [NSString stringWithFormat:@"itms://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",APPID];
//
////3、itms-apps:// 开头
//NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@&pageNumber=0&sortOrdering=2&mt=8", APPID];
//
////4、https:// 开头 此时的链接不可以，打开之后就跳转到iPhone自带的【音乐】APP里面了。
//NSString *urlStr = [NSString stringWithFormat:@"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&id=%@",APPID];
//
////打开链接地址
//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];

@end

