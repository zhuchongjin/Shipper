//
//  HDNetworking.m
//  PortableTreasure
//
//  Created by HeDong on 16/2/10.
//  Copyright © 2016年 hedong. All rights reserved.
//

#import "HDNetworking.h"
#import "AFNetworking.h"
#import "HDPicModle.h"
#import "UIImage+HDExtension.h"
#import "CJAppInfo.h"
#import "LogInVC.h"

@implementation HDNetworking
HDSingletonM(HDNetworking) // 单例实现
//static AFHTTPSessionManager *manager;
/**
 *  网络监测(在什么网络状态)
 *
 *  @param unknown          未知网络
 *  @param reachable        无网络
 *  @param reachableViaWWAN 蜂窝数据网
 *  @param reachableViaWiFi WiFi网络
 */
- (void)networkStatusUnknown:(Unknown)unknown reachable:(Reachable)reachable reachableViaWWAN:(ReachableViaWWAN)reachableViaWWAN reachableViaWiFi:(ReachableViaWiFi)reachableViaWiFi
{
    // 创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 监测到不同网络的情况
        NSLog(@"ddsfdsfdsfsdfs%ld",(long)status);
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
                unknown();
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                reachable();
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                reachableViaWWAN();
                
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                reachableViaWiFi();
                break;
                
            default:
                unknown();
                break;
        }
    }] ;
    [manager startMonitoring];
}



#pragma mark - 网络连接错误码处理
- (void)networkResponseErrorCodeDispose:(NSError * _Nonnull)error{
    
    //如果请求超时
    if (error.code == -1001) {
        ShowMessage(@"请求超时，请检查网络！");
    } else if (error.code == -1004) {
        ShowMessage(@"无法连接服务器");
    } else if (error.code == -1009) {
//        ShowMessage(CJStringWithFormat(@"您似乎断开了网络连接，请前往【设置】-【%@】-【无线数据】打开WLAN或者蜂窝网络",[CJAppInfo appName]));
    } else if (error.code == -1011) {
        ShowMessage(@"服务器暂时不可用");
    } else {
#ifdef DEBUG
        ShowMessage(CJStringWithFormat(@"%ld", (long)error.code));
#else
        
#endif
    }
}


/// 创建 AFHTTPSessionManager
- (AFHTTPSessionManager *)createSessionMangerWithHeader{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"text/html"];
    [contentTypes addObject:@"text/plain"];
    [contentTypes addObject:@"application/json"];
    [contentTypes addObject:@"image/jpeg"];
    [contentTypes addObject:@"image/jpg"];
    [contentTypes addObject:@"application/octet-stream"];
    
    [manager.requestSerializer setValue:@"max-age=0" forHTTPHeaderField:@"Cache-Control"];
    [manager.requestSerializer setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3" forHTTPHeaderField:@"Accept-Language"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [manager.requestSerializer setValue:@"binary" forHTTPHeaderField:@"Content-Encoding"];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : TIMEOUT);
    
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 设置请求参数
    //    [manager.requestSerializer setValue:IsStrEmpty([self enTokenCode:QDFetchMyDefault(CJLogInResponseToken)]) ? @"":CJStringWithFormat(@"Bearer %@",[self enTokenCode:QDFetchMyDefault(CJLogInResponseToken)]) forHTTPHeaderField:@"Authorization"];
    //    [manager.requestSerializer setValue:[QDControl getDeviceUUID] forHTTPHeaderField:@"deviceId"];
    //
//    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"source-id"];
//    [manager.requestSerializer setValue:@"arpa" forHTTPHeaderField:@"domain"];
//    [manager.requestSerializer setValue:StringCheck(QDUser.token) forHTTPHeaderField:@"token"];
//
    
    return manager;
}



///展示登陆页
- (void)showLogInVCWindowWithMsg:(NSString *)msg{
    //    清理缓存数据
//    [QDUser clearAllUserDefaultsData];
//
//    [[CJAlert shared]showStringTitle:msg nextStep:^(NSString *strSure) {
//
//        LogInVC *vc = [[LogInVC alloc]init];
//        UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
//        if ([viewController.presentedViewController isKindOfClass:[UINavigationController class]]) {
//            UINavigationController *navigation = (id)viewController.presentedViewController;
//            if ([navigation.topViewController isKindOfClass:[LogInVC class]]) return;
//        }
//
//        if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
//        if ([[QDControl getCurrentViewController] isKindOfClass:[LogInVC class]]) return;
//
//        if (vc.hidesBottomBarWhenPushed == NO) {
//            vc.hidesBottomBarWhenPushed = YES;
//        }
//        [[QDControl getCurrentViewController].navigationController pushViewController:vc animated:YES];
//    }];
    
}

- (void)showMsgString:(NSString *)str{
    
    if (![str isEqualToString:@""]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            ShowMessage(str);
        });
    }
}



#pragma mark ---------- 延时加载提示
///  延时方法
- (void)delayMethod{
    [CJAlert showLoading];
}

- (void)setDelayCarryOut{
    [self performSelector:@selector(delayMethod) withObject:nil/*可传任意类型参数*/ afterDelay:0.5];
}

- (void)cancleDelayCarryOut{
    
    //    撤销所有延时执行
    //    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    //    取消指定
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(delayMethod) object:nil];
}




#pragma mark ----------data json 网络请求-----

/// 网络请求 怎删改查
/// @param netType 请求方式
/// @param urlString URL
/// @param parameters <#parameters description#>
/// @param handleType <#handleType description#>
/// @param success <#success description#>
/// @param failure <#failure description#>
- (void)dataTaskWithHTTPMethod:(NetWorkType)netType url:(NSString *)urlString parameters:(id)parameters status:(DataHandleType)handleType success:(Success)success failure:(Failure)failure{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self setDelayCarryOut];
    
    NSString *strNetType = @"";
    switch (netType) {
        case PostType:
            strNetType = @"POST";
            break;
        case DeleteType:
            strNetType = @"DELETE";
            break;
        case PutType:
            strNetType = @"PUT";
            break;
        case GetType:
            strNetType = @"GET";
            break;
        default:
            break;
    }
    
    @weakify(self);
//    NSURLSessionDataTask *dataTask = [[self createSessionMangerWithHeader] dataTaskWithHTTPMethod:strNetType URLString:urlString parameters:parameters headers:nil uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NLog(@"\n[%@]\n%@\n参数:\n%@\n响应:\n%@", @"接口", urlString, parameters, [responseObject jsonPrettyStringEncoded]);
//
//        @strongify(self);
//        [self cancleDelayCarryOut];
//        [CJAlert dismiss];
//
//        /* SSO
//         code 登录成功的 情况
//         1 code = 0 || code = 200
//
//         code 登录失效的情况
//         1 code = 702 未登录
//         2 code = 703 令牌过期
//         3 code = 704 令牌非法
//         4 code = 705 其他设备登录
//         */
//        NSString *code = [QDControl getStr:responseObject[@"code"]];
//        NSString *status = [QDControl getStr:responseObject[@"status"]];
//        NSString *msg = [QDControl getStr:responseObject[@"msg"]];
//
//        //        登录失效
//        if (code.intValue == 702 || code.intValue == 703 || code.intValue == 704 || code.intValue == 705) {
//            [self showLogInVCWindowWithMsg:msg];
//            return;
//        }
//
//        //        有数据
//        if ((code.intValue == 0 && ![[QDControl getStr:code] isEqualToString:@""]) || code.intValue == 200 || status.intValue == 0) {
//        }else{
//            [QDDriverUtils showToast:msg];
//            NSError * _Nonnull error;
//            failure(error);
//            return;
//        }
//
//        if (handleType == ArpaDefault) {
//            if (IsNilOrNull(responseObject[@"data"])) {
//                success(@"");
//            }else{
//                success(responseObject[@"data"]);
//            }
//        }else if (handleType == OperationTip){
//            [[CJAlert shared]showStringTitle:msg nextStep:^(NSString *strSure) {
//                if (IsNilOrNull(responseObject[@"data"])) {
//                    success(@"");
//                }else{
//                    success(responseObject[@"data"]);
//                }
//            }];
//
//        }else if (handleType == ReturnAllData){
//            success(responseObject);
//        }
//
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        @strongify(self);
//        [self cancleDelayCarryOut];
//        [CJAlert dismiss];
//        if (failure){
//            failure(error);
//        }
//        [self networkResponseErrorCodeDispose:error];
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//    }];
//    [dataTask resume];
}


/// json  请求
/// @param netType <#netType description#>
/// @param urlString <#urlString description#>
/// @param parameter <#parameter description#>
/// @param handleType <#handleType description#>
/// @param success <#success description#>
/// @param failure <#failure description#>
- (void)jsonTaskWithHTTPMethod:(NetWorkType)netType url:(NSString *)urlString parameters:(id)parameter status:(DataHandleType)handleType success:(Success)success failure:(Failure)failure{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self setDelayCarryOut];
    
    NSString *strNetType = @"";
    switch (netType) {
        case PostType:
            strNetType = @"POST";
            break;
        case DeleteType:
            strNetType = @"DELETE";
            break;
        case PutType:
            strNetType = @"PUT";
            break;
        case GetType:
            strNetType = @"GET";
            break;
        default:
            break;
    }
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:strNetType URLString:urlString parameters:parameter error:nil];
    request.timeoutInterval = TIMEOUT;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
//    [request setValue:@"2" forHTTPHeaderField:@"source-id"];
//    [request setValue:@"arpa" forHTTPHeaderField:@"domain"];
//    NSString *token = StringCheck(QDUser.token);
//    [request setValue:token forHTTPHeaderField:@"token"];
    
    @weakify(self);
//    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request
//                                               uploadProgress:nil
//                                             downloadProgress:nil
//                                            completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        NLog(@"\n[%@]\n%@\n参数:\n%@\n响应:\n%@", @"接口", urlString, parameter, [responseObject jsonPrettyStringEncoded]);
//        @strongify(self);
//        [self cancleDelayCarryOut];
//        [CJAlert dismiss];
//
//        if (!error) {
//            [self cancleDelayCarryOut];
//            [CJAlert dismiss];
//
//            /* SSO
//             code 登录成功的 情况
//             1 code = 0 || code = 200
//
//             code 登录失效的情况
//             1 code = 702 未登录
//             2 code = 703 令牌过期
//             3 code = 704 令牌非法
//             4 code = 705 其他设备登录
//             */
//            NSString *code = [QDControl getStr:responseObject[@"code"]];
//            NSString *status = [QDControl getStr:responseObject[@"status"]];
//            NSString *msg = [QDControl getStr:responseObject[@"msg"]];
//
//            //        登录失效
//            if (code.intValue == 702 || code.intValue == 703 || code.intValue == 704 || code.intValue == 705) {
//                [self showLogInVCWindowWithMsg:msg];
//                return;
//            }
//            //        有数据
//            if ((code.intValue == 0 && ![[QDControl getStr:code] isEqualToString:@""]) || code.intValue == 200 || status.intValue == 0) {
//
//            }else{
//                failure(error);
//                [self showMsgString:msg];
//                return;
//            }
//
//            if (handleType == ArpaDefault) {
//                if (IsNilOrNull(responseObject[@"data"])) {
//                    success(@"");
//                }else{
//                    success(responseObject[@"data"]);
//                }
//            }else if (handleType == OperationTip){
//                [[CJAlert shared]showStringTitle:msg nextStep:^(NSString *strSure) {
//                    if (IsNilOrNull(responseObject[@"data"])) {
//                        success(@"");
//                    }else{
//                        success(responseObject[@"data"]);
//                    }
//                }];
//            }else if (handleType == ReturnAllData){
//                success(responseObject);
//            }
//
//            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        } else {
//
//            [self cancleDelayCarryOut];
//            [CJAlert dismiss];
//
//            NSArray *errArr = responseObject[@"errors"];
//            if (errArr.count > 0) {
//                NSDictionary *errD = [errArr firstObject];
//                ShowMessage([errD stringValueForKey:@"defaultMessage" default:@"未知错误"]);
//                error = [NSError errorCode:400];
//            } else {
//                [self networkResponseErrorCodeDispose:error];
//            }
//
//            if (failure){
//                failure(error);
//            }
//            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        }
//    }];
    
//    [task resume];
}


/**
 *  封装POST图片上传(单张图片) // 可扩展成单个别的数据上传如:mp3等
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param picModle   上传的图片模型
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters andPic:(HDPicModle *)picModle progress:(Progress)progress success:(Success)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : 20);
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 请求不使用AFN默认转换,保持原有数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // 响应不使用AFN默认转换,保持原有数据
    
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : TIMEOUT);
    
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 设置请求参数
//    [manager.requestSerializer setValue:@"1" forHTTPHeaderField:@"source-id"];
//    [manager.requestSerializer setValue:@"arpa" forHTTPHeaderField:@"domain"];
//    [manager.requestSerializer setValue:StringCheck(QDUser.token) forHTTPHeaderField:@"token"];
    
    
    [CJAlert showLoading];
    
    @weakify(self);
//    [manager POST:URLString parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        /**
//         *  压缩图片然后再上传(1.0代表无损 0~~1.0区间)
//         */
//        NSData *data = UIImageJPEGRepresentation(picModle.pic, 0.8); // 1.0
//        CGFloat precent = self.picSize / (data.length / 1024.0);
//        if (precent > 1)
//        {
//            precent = 1.0;
//        }
//        data = nil;
//        data = UIImageJPEGRepresentation(picModle.pic, precent);
//        [formData appendPartWithFileData:data name:picModle.picName fileName:picModle.fileName mimeType:@"image/jpeg"];
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//        if (progress)
//        {
//            progress(uploadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
//        }
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        [CJAlert dismiss];
//        if (success){
//            NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//            success(dic);
//            
//            NSString *strStatus = [QDControl getStr:dic[@"status"]];
//            if (strStatus.intValue != 0) {
//                ShowMessage([QDControl getStr:dic[@"msg"]]);
//            }
//        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        @strongify(self);
//        if (failure){
//            failure(error);
//        }
//        [CJAlert dismiss];
//        [self networkResponseErrorCodeDispose:error];
//        
//    }];
    
}



@end



