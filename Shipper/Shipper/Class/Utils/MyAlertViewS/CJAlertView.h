//
//  CJAlertView.h
//  Shipper
//
//  Created by mac on 2019/11/25.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^OnSureClick)(NSString *strSure);
typedef void (^OnCancleClick)(NSString *strCancle);
@interface CJAlertView : UIView

-(instancetype)initWithTitle:(NSString *)strTitle strContent:(NSString *)strContent  ClickOnSure:(OnSureClick )sureClick ClickOnCancle:(OnCancleClick )cancleClick;

-(void)setSureTitle:(NSString *)strSure;
-(void)setCancleTitle:(NSString *)strCancle;

@end

NS_ASSUME_NONNULL_END
