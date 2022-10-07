//
//  BaseViewModel.h
//  Shipper
//
//  Created by admin on 2021/6/3.
//  Copyright © 2021 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SuccessBlock)(id data);
typedef void(^FailBlock)(id data);

@interface BaseViewModel : NSObject{
    @public
//    NSString *name;
}

@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailBlock failBlock;
- (void)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock)failBlock;


@property (nonatomic, strong, readonly) RACSubject *dataSignal;
@property (nonatomic, strong, readonly) RACSubject *errorSignal;
@property (nonatomic, strong, readonly) RACSubject *successSignal;

/**
 取消获取数据
 */
- (void)cancelData;
@end

NS_ASSUME_NONNULL_END
