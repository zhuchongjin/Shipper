//
//  CJAlertView.m
//  Shipper
//
//  Created by mac on 2019/11/25.
//  Copyright © 2019 admin. All rights reserved.
//

#import "CJAlertView.h"
static const CGFloat AlertViewWidth = 270.0;
//static const CGFloat AlertViewContentMargin = 9;
//static const CGFloat AlertViewVerticalElementSpace = 10;
//static const CGFloat AlertViewButtonHeight = 44;
//static const CGFloat AlertViewLineLayerWidth = 0.5;

@interface CJAlertView()
@property (nonatomic,strong) CJView *viewHeader;
@property (strong, nonatomic) CJImageView *imgVHeader;
@property (strong, nonatomic) CJLabel *labTitle;
@property (strong, nonatomic) CJLabel *labContent;
@property (strong, nonatomic) CJButton *btnSure;
@property (strong, nonatomic) CJButton *btnCancle;
@property (nonatomic,copy) OnSureClick sureBlock;
@property (nonatomic,copy) OnCancleClick cancleBlock;

@end
@implementation CJAlertView


-(instancetype)initWithTitle:(NSString *)strTitle strContent:(NSString *)strContent  ClickOnSure:(OnSureClick )sureClick ClickOnCancle:(OnCancleClick )cancleClick{
    
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, AlertViewWidth, 261);
        self.backgroundColor = [UIColor cjWhiteColor];
//        [CJUtil getViewCutAllCornRound:self height:10];
        
        strTitle =  [strTitle isEqualToString:@""] ? @"提示":strTitle;
    
//        CGRectMake((self.width - 50)/2, 30, 50, 50)

        self.viewHeader.backgroundColor = [UIColor cjWhiteColor];
        self.imgVHeader.image = UIImageNamed(@"zcj_tong_zhi");
        self.imgVHeader.frame = CGRectMake(0, 0, 50, 50);
        
        [self addSubview:self.viewHeader];
        self.imgVHeader.centerY = self.viewHeader.centerY + 8;
        self.imgVHeader.centerX = self.viewHeader.centerX;
        [self.viewHeader addSubview:self.imgVHeader];
        
        [self addSubview:self.labTitle];
        [self addSubview:self.labContent];
        [self addSubview:self.btnCancle];
        [self addSubview:self.btnSure];
        
        self.labTitle.text = strTitle;
        self.labContent.text = strContent;

        self.sureBlock = sureClick;
        self.cancleBlock = cancleClick;

    }
    return self;
}

- (CJView *)viewHeader{
    if (!_viewHeader) {
        _viewHeader =CJView.viewInit
        .viewFrame(CGRectMake(0, 0, self.width, 75))
        .viewbgColor([UIColor cjWhiteColor])
        ;
    }
    return  _viewHeader;
}

- (void)btnClickSureAction:(CJButton *)sender{
    if (self.sureBlock) {
        
        self.sureBlock(@"");
    }
    WLAlertView * alerView =(WLAlertView *)[self superview];
    [alerView dismissAnimated:YES];
}
- (void)btnClickCancleAction:(CJButton *)sender{
    if (self.cancleBlock) {
        
        self.cancleBlock(@"");
    }
    WLAlertView * alerView =(WLAlertView *)[self superview];
    [alerView dismissAnimated:YES];
}


/**
 *  标题、内容动态行高的计算
 *
 *  @return CGRect
 */
- (CGRect)adjustLabelFrameHeight:(UILabel *)label
{
    CGFloat height;
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGSize size = [label.text sizeWithFont:label.font
                             constrainedToSize:CGSizeMake(label.frame.size.width, FLT_MAX)
                                 lineBreakMode:NSLineBreakByWordWrapping];
        
        height = size.height;
#pragma clang diagnostic pop
    } else {
        NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
        context.minimumScaleFactor = 1.0;
        CGRect bounds = [label.text boundingRectWithSize:CGSizeMake(label.frame.size.width, FLT_MAX)
                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                              attributes:@{NSFontAttributeName:label.font}
                                                 context:context];
        height = bounds.size.height;
    }
    
    return CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width,label.text.length?height:0);
}
-(void)setSureTitle:(NSString *)strSure{
    self.btnSure.btnText(strSure);
}
-(void)setCancleTitle:(NSString *)strCancle{
    self.btnCancle.btnText(strCancle);
}

#pragma mark ----------lazy

- (CJImageView *)imgVHeader{
    if (!_imgVHeader) {
        _imgVHeader = CJImageView.imgInit
        .imgVFrame(CGRectMake((self.width - 50)/2, 30, 50, 50))
        .imgVImageName(@"zcj_tong_zhi")
        ;
    }
    return _imgVHeader;
}

- (CJLabel *)labTitle{
    if (!_labTitle) {
        _labTitle = CJLabel.labInit
        .labFrame(CGRectMake(0, _viewHeader.bottom + 15, self.width, 20))
        .labFontSize(18)
        .labAlignment(NSTextAlignmentCenter)
        ;
    }
    return _labTitle;
}

- (CJLabel *)labContent{
    if (!_labContent) {
        
        _labContent = CJLabel.labInit
        .labFrame(CGRectMake(10, _labTitle.bottom + 5, self.width-20, 50))
        .labFontSize(16)
        .labAlignment(NSTextAlignmentCenter)
        .labTextColor([UIColor cjSubheadTextColor])
        .labAdjustsFontSizeToFitWidth(YES)
        ;
    }
    return _labContent;
}
- (CJButton *)btnCancle{
    
    if (!_btnCancle) {
        _btnCancle = CJButton.btnInit
        .btnFrame(CGRectMake(45, _labContent.bottom + 15, 80,35))
        .btnText(@"取消")
        .btnFontSize(15)
        .btnBgColor([UIColor cjWhiteColor])
        .btnCornerWidth(0.5)
        .btnCornerRadius(5)
        .btnCornerColor([UIColor cjMainColor])
        .btnNormalTitleColor([UIColor cjMainColor])
        .btnTargetAction(self,@selector(btnClickCancleAction:))

        ;
    }
    return _btnCancle;
}

- (CJButton *)btnSure{
    
    if (!_btnSure) {
        _btnSure = CJButton.btnInit
        .btnFrame(CGRectMake(self.width -45 - 80, _btnCancle.top, _btnCancle.width,_btnCancle.height ))
        .btnText(@"确定")
        .btnFontSize(15)
        .btnBgColor([UIColor cjMainColor])
//        .btnCornerWidth(0.5)
        .btnCornerRadius(5)
        .btnNormalTitleColor([UIColor cjWhiteColor])
        .btnTargetAction(self,@selector(btnClickSureAction:))
        ;
    }
    return _btnSure;
}
@end
