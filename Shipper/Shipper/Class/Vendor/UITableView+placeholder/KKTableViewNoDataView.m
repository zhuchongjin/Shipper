//
//  UITableView+placeholder.m
//  BeautifulAgent
//
//  Created by 吴灶洲 on 2017/7/20.
//  Copyright © 2017年 kkmac. All rights reserved.
//

#import "KKTableViewNoDataView.h"

@interface KKTableViewNoDataView ()

@property (nonatomic, copy) void(^clickBlock)(void);
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIImage *img;
@property (nonatomic,strong) CJLabel *labConntent;
@end


@implementation KKTableViewNoDataView

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img viewClick:(void(^)(void))clickBlock {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor cjBackgroundColor];
        self.clickBlock = clickBlock;
        self.img = [UIImage imageNamed:@"zcj_quesheng"]; 
        [self setupSubViews];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setupSubViews {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:self.img];
    imgView.width = 192;
    imgView.height = 192;
    [self addSubview:imgView];
    self.imgView = imgView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImgView:)];
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:tap];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.imgView.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0 - 50);
    [self addSubview:self.labConntent];
}

- (void)clickImgView:(UITapGestureRecognizer *)recognizer {
    self.clickBlock();
}

- (CJLabel *)labConntent{
    if (!_labConntent) {
        _labConntent = CJLabel.labInit
        .labFrame(CGRectMake(0, self.imgView.bottom + 30, self.width, 30))
        .labText(@"暂无数据") //点击或下拉刷新
        .labTextColor([UIColor cjSubheadTextColor])
        .labAlignment(NSTextAlignmentCenter)
        ;
    }
    return _labConntent;
}
@end



