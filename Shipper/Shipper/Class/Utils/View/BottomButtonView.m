//
//  BottomButtonView.m
//  Shipper
//
//  Created by zcj on 2022/10/7.
//  Copyright © 2022 admin. All rights reserved.
//

#import "BottomButtonView.h"

@interface BottomButtonView()
@property (nonatomic,strong) FlexTouchView *touchViewLeft;/**<  <#Description#> */
@property (nonatomic,strong) UILabel *labLeft;/**<  <#Description#> */
@property (nonatomic,strong) UIView *viewMid;/**<  <#Description#> */
@property (nonatomic,strong) FlexTouchView *touchViewRight;/**<  <#Description#> */
@property (nonatomic,strong) UILabel *labRight;/**<  <#Description#> */

@end

@implementation BottomButtonView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}


- (void)setHideLeft:(BOOL)hideLeft{
    _hideLeft = hideLeft;
    self.viewMid.hidden = hideLeft;
    self.touchViewLeft.hidden = hideLeft;
}

- (void)setHideRight:(BOOL)hideRight{
    _hideRight = hideRight;
    self.viewMid.hidden = hideRight;
    self.touchViewRight.hidden = hideRight;
}

- (void)setLeftText:(NSString *)leftText{
    _leftText = leftText;
    self.labLeft.text = leftText;
}

- (void)setRightText:(NSString *)rightText{
    _rightText = rightText;
    self.labRight.text = rightText;
}

#pragma mark ----------BtnAction--

- (void)touchLeftAction{
    if(self.blockLeft){
        self.blockLeft(@"");
    }
}

- (void)touchRightAction{
    if(self.blockRight){
        self.blockRight(@"");
    }
}

@end
