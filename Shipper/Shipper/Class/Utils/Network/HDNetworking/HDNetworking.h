//
//  HDNetworking.h
//  PortableTreasure
//
//  Created by HeDong on 16/2/10.
//  Copyright © 2016年 hedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDSingleton.h"
//#import <AFNetworking.h>

#define NetWorkingManager [HDNetworking sharedHDNetworking]

NS_ASSUME_NONNULL_BEGIN

/**
 *   请求方式枚举 增删修查
 */
typedef NS_ENUM(NSUInteger, NetWorkType) {

    PostType = 0,
    DeleteType,
    PutType,
    GetType
};

/**
 *   数据处理方式枚举
 */
typedef NS_ENUM(NSUInteger, DataHandleType) {

    DefaultData = 0,  // 默认数据
    OperationTip, // 操作提示 交互反馈
    ReturnAllData, //返回所有数据
};


//请求超时
#define TIMEOUT 20
@class HDPicModle;

typedef void (^ _Nullable Success)(id responseObject);     // 成功Block
typedef void (^ _Nullable Failure)(NSError *error);        // 失败Blcok
typedef void (^ _Nullable Progress)(NSProgress * _Nullable progress); // 上传或者下载进度Block
typedef NSURL * _Nullable (^ _Nullable Destination)(NSURL *targetPath, NSURLResponse *response); //返回URL的Block
typedef void (^ _Nullable DownLoadSuccess)(NSURLResponse * __nullable response, NSURL * _Nullable filePath); // 下载成功的Blcok

typedef void (^ _Nullable Unknown)(void);          // 未知网络状态的Block
typedef void (^ _Nullable Reachable)(void);        // 无网络的Blcok
typedef void (^ _Nullable ReachableViaWWAN)(void); // 蜂窝数据网的Block
typedef void (^ _Nullable ReachableViaWiFi)(void); // WiFi网络的Block

@interface HDNetworking : NSObject
HDSingletonH(HDNetworking) // 单例声明

/**
 *  上传图片大小(kb)
 */
@property (nonatomic, assign) NSUInteger picSize;

/**
 *  超时时间(默认20秒)
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 *  可接受的响应内容类型
 */
@property (nonatomic, copy) NSSet <NSString *> *acceptableContentTypes;

/**
 *  网络监测(在什么网络状态)
 *
 *  @param unknown          未知网络
 *  @param reachable        无网络
 *  @param reachableViaWWAN 蜂窝数据网
 *  @param reachableViaWiFi WiFi网络
 */
- (void)networkStatusUnknown:(Unknown)unknown reachable:(Reachable)reachable reachableViaWWAN:(ReachableViaWWAN)reachableViaWWAN reachableViaWiFi:(ReachableViaWiFi)reachableViaWiFi;


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
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters andPic:(HDPicModle *)picModle progress:(Progress)progress success:(Success)success failure:(Failure)failure;


#pragma mark ----------new-----

/// 网络请求 怎删改查
/// @param netType 请求方式
/// @param urlString URL
/// @param parameters <#parameters description#>
/// @param handleType <#handleType description#>
/// @param success <#success description#>
/// @param failure <#failure description#>
- (void)dataTaskWithHTTPMethod:(NetWorkType)netType url:(NSString *)urlString parameters:(id)parameters status:(DataHandleType)handleType success:(Success)success failure:(Failure)failure;

/// json 请求
/// @param netType <#netType description#>
/// @param urlString <#urlString description#>
/// @param parameter <#parameter description#>
/// @param handleType <#handleType description#>
/// @param success <#success description#>
/// @param failure <#failure description#>
- (void)jsonTaskWithHTTPMethod:(NetWorkType)netType url:(NSString *)urlString parameters:(id)parameter status:(DataHandleType)handleType success:(Success)success failure:(Failure)failure;


@end

NS_ASSUME_NONNULL_END


