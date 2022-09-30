//
//  CommentVC.m
//  NtoccShipper
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 zhuchongjin. All rights reserved.
//

#import "CommentVC.h"
#import "HCSStarRatingView.h"

@interface CommentVC ()
@property (nonatomic,strong) CJView *viewStarServer;
@property (nonatomic,strong) CJView *viewStarDelivery;
@property (nonatomic,strong) CJImageView *imgVAbnormal;
@property (nonatomic,copy) NSString *strAbnormal; // 0 1异常
@property (nonatomic,strong) HCSStarRatingView *viewRateServer;
@property (nonatomic,strong) HCSStarRatingView *viewRateAbnormal;

@end

@implementation CommentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitleName:CJLString(@"发布评论")];
    [self setBackLeftButton:@""];
//    [self setSecondAppNavigationBarStyle];
    
    self.strAbnormal = @"0";
    [self createView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

}
/// 创建tableview 等
- (void)createView{

    CGRect rcFrame = CGRectMake(0, kTopHeight, kScreenWidth, 0);
    FlexFrameView *header = [[FlexFrameView alloc] initWithFlex:@"CommentTopView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    
    
    [self.viewStarServer addSubview:self.viewRateServer];
    [self.viewRateServer addTarget:self action:@selector(didChangeServerValue:) forControlEvents:UIControlEventValueChanged];
    
    [self.viewStarDelivery addSubview:self.viewRateAbnormal];
    [self.viewRateAbnormal addTarget:self action:@selector(didChangeAbnormalValue:) forControlEvents:UIControlEventValueChanged];
    
    
    [header layoutIfNeeded];
    [self.view addSubview:header];

}


- (void)btnIsAbnormalAction{
    
    if ([self.strAbnormal isEqualToString:@"0"]) {
        self.strAbnormal = @"1";
        self.imgVAbnormal.image = [UIImage imageNamed:@"selected"];
    }else{
//
        self.strAbnormal = @"0";
        self.imgVAbnormal.image = [UIImage imageNamed:@"unSelected"];
    }
    
}

- (void)didChangeServerValue:(HCSStarRatingView *)sender {
    NSLog(@"Changed rating to %.1f", sender.value);
}

- (void)didChangeAbnormalValue:(HCSStarRatingView *)sender {
    NSLog(@"Changed Abnormal to %.1f", sender.value);
}

- (HCSStarRatingView *)viewRateServer{
    if (!_viewRateServer) {
      _viewRateServer =   [[HCSStarRatingView alloc]initWithFrame:CGRectMake(0,0,150 ,40)];
        _viewRateServer.tintColor = [UIColor cjMainColor];
        _viewRateServer.backgroundColor = [UIColor cjClearColor];
//        _viewRate.enabled = NO;
        _viewRateServer.allowsHalfStars = YES;
        _viewRateServer.maximumValue = 5;
        _viewRateServer.minimumValue = 0;
    }
    return  _viewRateServer;
}


- (HCSStarRatingView *)viewRateAbnormal{
    if (!_viewRateAbnormal) {
      _viewRateAbnormal =   [[HCSStarRatingView alloc]initWithFrame:CGRectMake(0,0,150 ,40)];
        _viewRateAbnormal.tintColor = [UIColor cjMainColor];
        _viewRateServer.backgroundColor = [UIColor cjClearColor];
//        _viewRate.enabled = NO;
        _viewRateAbnormal.allowsHalfStars = YES;
        _viewRateAbnormal.maximumValue = 5;
        _viewRateAbnormal.minimumValue = 0;
    }
    return  _viewRateAbnormal;
}
@end
