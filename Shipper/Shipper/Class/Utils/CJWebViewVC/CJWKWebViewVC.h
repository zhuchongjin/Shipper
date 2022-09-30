//
//  CJWKWebViewVC.h
//  Shipper
//
//  Created by mac on 2019/12/27.
//  Copyright © 2019 admin. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CJWKWebViewVC : BaseViewController
@property (nonatomic,copy) NSString *strTitle;
@property (nonatomic,copy) NSString *strUrl;
@property (nonatomic,assign) BOOL useUTF8;
@end

NS_ASSUME_NONNULL_END
