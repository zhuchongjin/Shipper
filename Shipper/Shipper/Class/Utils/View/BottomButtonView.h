//
//  BottomButtonView.h
//  Shipper
//
//  Created by zcj on 2022/10/7.
//  Copyright © 2022 admin. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BottomButtonView : BaseView
@property (nonatomic,copy) CJBlock blockLeft;/**<  <#Description#> */
@property (nonatomic,copy) CJBlock blockRight;/**<  <#Description#> */

@property (nonatomic,assign) BOOL hideLeft;/**<  隐藏左侧按钮 */
@property (nonatomic,assign) BOOL hideRight;/**<  隐藏右侧按钮 */

@property (nonatomic,copy) NSString *leftText;/**<  左侧按钮文本 */
@property (nonatomic,copy) NSString *rightText;/**<  右侧按钮文本 */

@end

NS_ASSUME_NONNULL_END
