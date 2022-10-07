//
//  HuiDanShangChuanVC.m
//  Shipper
//
//  Created by zcj on 2022/10/7.
//  Copyright © 2022 admin. All rights reserved.
//

#import "HuiDanShangChuanVC.h"
#import "UpLoadImageView.h"

@interface HuiDanShangChuanVC ()
@property (nonatomic,strong) UpLoadImageView *upLoadImgView;/**<  <#Description#> */
@property (nonatomic,strong) UIView *viewImg;/**<  上传 */
@property (nonatomic,strong) FlexFrameView *header;/**<  <#Description#> */
@end

@implementation HuiDanShangChuanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleName:@"回单上传"];
    [self setBackLeftButton:@""];

    [self.view addSubview:self.baseTableView];
    [self createView];
}

- (void)createView{
    
    CGRect rcFrame = CGRectMake(0, 0, kScreenWidth, 0);
    self.header = [[FlexFrameView alloc]initWithFlex:@"HuiDanShangChuanView" Frame:rcFrame Owner:self];
    self.header.flexibleHeight = YES;
    [self.header layoutIfNeeded];
    
    self.viewImg.height = 120;
    [self.viewImg addSubview:self.upLoadImgView];

    self.baseTableView.tableHeaderView = self.header;
    self.baseTableView.frame = CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight-kTopHeight - kBottomSafeHeight);
    [self.baseTableView reloadData];
}


#pragma mark ----------lazy
- (UpLoadImageView *)upLoadImgView{
    if(!_upLoadImgView){
        _upLoadImgView = [[UpLoadImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
        _upLoadImgView.flexibleHeight = YES;
        [_upLoadImgView layoutIfNeeded];
        _upLoadImgView.setDefaultHeigt = YES;
        _upLoadImgView.setShowImg = NO;
        @weakify(self);
        _upLoadImgView.blockHeight = ^(CGFloat height) {
            @strongify(self);
            DLog(@"===== %f",height);
            self.viewImg.height = height;
            [self.viewImg layoutIfNeeded];
            [self.header layoutIfNeeded];
            [self.baseTableView reloadData];
        };
    }
    
    return _upLoadImgView;
}

@end
