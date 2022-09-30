//
//  BaseViewModel.m
//  Shipper
//
//  Created by zcj on 2021/6/3.
//  Copyright © 2021 admin. All rights reserved.
//

#import "BaseViewModel.h"


@interface BaseViewModel ()
@property (nonatomic, strong, readwrite) RACSubject *dataSignal;
@property (nonatomic, strong, readwrite) RACSubject *errorSignal;
@property (nonatomic, strong, readwrite) RACSubject *successSignal;

@end

@implementation BaseViewModel


- (void)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock)failBlock{
    _successBlock = successBlock;
    _failBlock    = failBlock;
}



- (RACSubject *)successSignal {
    if (!_successSignal) {
        _successSignal = [RACSubject subject];
    }
    return _successSignal;
}

- (RACSubject *)dataSignal {
    if (!_dataSignal) {
        _dataSignal = [RACSubject subject];
    }
    return _dataSignal;
}

- (RACSubject *)errorSignal {
    if (!_errorSignal) {
        _errorSignal = [RACSubject subject];
    }
    return _errorSignal;
}

- (void)cancelData{
    
}


@end
