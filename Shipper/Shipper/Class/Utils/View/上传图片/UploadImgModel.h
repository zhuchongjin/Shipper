//
//  UploadImgModel.h
//  NtoccShipper
//
//  Created by mac on 2020/7/15.
//  Copyright © 2020 zhuchongjin. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UploadImgModel : BaseModel
@property (nonatomic,copy) NSString *strImgUrl;
@property (nonatomic,assign) BOOL changeImg;
@property (nonatomic,copy) NSString *strTitle;
@property (nonatomic,assign) BOOL hideDeleteImg;

@end

NS_ASSUME_NONNULL_END
