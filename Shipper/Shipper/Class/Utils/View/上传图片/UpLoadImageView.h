//
//  UpLoadImageView.h
//  Shipper
//
//  Created by zcj on 2022/10/7.
//  Copyright © 2022 admin. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^ViewHBlock)(CGFloat height);

@interface UpLoadImageView : BaseView

@property (nonatomic,assign) BOOL setDefaultHeigt;/**<  设置默认高度  100  必传*/
@property (nonatomic,assign) BOOL setShowImg;/**<  展示图片   必传*/
@property (nonatomic,strong) NSMutableArray *listImgUrl;/**<  照片数据源 外部 */
@property (nonatomic,copy) ViewHBlock blockHeight;/**<  <#Description#> */

@end

NS_ASSUME_NONNULL_END
