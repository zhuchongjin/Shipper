//
//  YunYingVC.m
//  Shipper
//
//  Created by admin on 2022/9/29.
//  Copyright © 2022 admin. All rights reserved.
//

#import "YunYingVC.h"
#import "YunYingListVC.h"

@interface YunYingVC ()

@end

@implementation YunYingVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    // Do any additional setup after loading the view.

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont cjTitleFont18];
    titleLabel.textColor = [UIColor cjWhiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"运营";
    self.navigationItem.titleView = titleLabel;

    self.titles = @[@"全部",@"紧急单",@"待指派",@"在途中",@"待确认",@"已完成",@"已取消"];

  
    self.navigationController.navigationBar.barTintColor = [UIColor cjMainColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor cjMainColor];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -kStatusBarHeight, self.view.bounds.size.width, kStatusBarHeight)];
    statusBarView.backgroundColor = [UIColor cjMainColor];
    [self.navigationController.navigationBar addSubview:statusBarView];
    
    self.menuViewStyle = WMMenuViewStyleLine;
    self.titleSizeSelected = 16;
    self.titleSizeNormal = 14;
    //
    self.progressViewIsNaughty = YES;
    self.progressWidth = 30;
    self.progressHeight = 2;
    self.titleColorNormal = [UIColor cjMainTextColor];
    self.titleColorSelected = [UIColor cjMainColor];
    self.showOnNavigationBar = NO;

    [super viewDidLoad];
}


//1、返回分页数量，可以再这里设置标题栏各种样式
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return 7;//self.titles.count;
}

//3、把标题与分页对应起来
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    YunYingListVC* vc  = [[YunYingListVC alloc]init];
    vc.strTitle = self.titles[index];
    return vc;
}

- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width ;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
    menuView.backgroundColor = [UIColor clearColor];
    return CGRectMake(0, kTopHeight, self.view.frame.size.width, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
    
}







@end

