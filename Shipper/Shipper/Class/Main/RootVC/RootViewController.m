//
//  RootViewController.m
//  TMSDriver
//
//  Created by admin on 2018/3/7.
//  Copyright © 2018年 admin All rights reserved.
//

#import "RootViewController.h"
#import "MineViewController.h"
#import "BaoBiaoVC.h"
#import "YunYingVC.h"
#import "KaiDanVC.h"


@interface RootViewController ()<UITabBarDelegate,UITabBarControllerDelegate>
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTab];
}
-(void)createTab{
    
    NSDictionary * dict1 = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
    NSDictionary * dict = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor cjMainColor]};
    
    
    // 开单
    KaiDanVC * kaidan = [[KaiDanVC alloc]init];
    kaidan.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"开单" image:[[UIImage imageNamed:@"tab_mine_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_mine_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [kaidan.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    [kaidan.tabBarItem setTitleTextAttributes:dict1 forState:UIControlStateNormal];
    UINavigationController * nav_kaidan = [[UINavigationController alloc]initWithRootViewController:kaidan];
    
    // 运营
    YunYingVC * yungying = [[YunYingVC alloc]init];
    yungying.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"运营管理" image:[[UIImage imageNamed:@"tab_mine_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_mine_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [yungying.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    [yungying.tabBarItem setTitleTextAttributes:dict1 forState:UIControlStateNormal];
    UINavigationController * nav_yungying = [[UINavigationController alloc]initWithRootViewController:yungying];
    
    
    // 报表
    BaoBiaoVC * baobiao = [[BaoBiaoVC alloc]init];
    baobiao.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"报表中心" image:[[UIImage imageNamed:@"tab_mine_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_mine_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [baobiao.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    [baobiao.tabBarItem setTitleTextAttributes:dict1 forState:UIControlStateNormal];
    UINavigationController * nav_baobiao = [[UINavigationController alloc]initWithRootViewController:baobiao];
    
    // 我的
    MineViewController * wode = [[MineViewController alloc]init];
    wode.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"个人中心" image:[[UIImage imageNamed:@"tab_mine_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_mine_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [wode.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    [wode.tabBarItem setTitleTextAttributes:dict1 forState:UIControlStateNormal];
    UINavigationController * nav_wode = [[UINavigationController alloc]initWithRootViewController:wode];
    
    
    [[UITabBar appearance]setTranslucent:NO];
        [[UITabBar appearance] setUnselectedItemTintColor:CJHexColor(0x999999)];
    [[UITabBar appearance] setBackgroundColor:[UIColor cjWhiteColor]];
    self.viewControllers = @[nav_kaidan,nav_yungying,nav_baobiao,nav_wode];
    self.delegate = self;
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0){
    
//    if (self.nav3 == viewController) {
//    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
