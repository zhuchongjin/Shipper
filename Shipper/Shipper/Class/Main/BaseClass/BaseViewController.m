//
//  BaseViewController.m
//  TMSDriver
//
//  Created by admin on 2018/3/6.
//  Copyright © 2018年 admin All rights reserved.
//

#import "BaseViewController.h"
#import "LogInVC.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "IQKeyboardManager.h"
@interface BaseViewController ()<UISearchBarDelegate,UITextFieldDelegate>{
    BOOL  showLoginYES;
}
@property (nonatomic,copy) OnSureClick sureBlock;
@property (nonatomic,copy) OnCancleClick cancleBlock;
@end
#define UIFontMake(size) [UIFont systemFontOfSize:size]

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cjBackgroundColor];
    self.navigationController.navigationBarHidden = YES;
    self.image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kStatusBarHeight+kNavBarHeight)];
    self.image.userInteractionEnabled = YES;
    self.image.backgroundColor = [UIColor cjMainColor]; //CJNavBarColor;
    [self.view addSubview:self.image];
    
//    RegisterNotify(LOGOUT, @selector(notifyMethod:));
    // Do any additional setup after loading the view.
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 40.0f;
    [self isNetworking];
    [self base_bindViewModel];
}


- (void)base_bindViewModel{};
-(void)isNetworking{
    // 创建网络监测者
    if (![[YYReachability reachability] isReachable]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败，请检查网络后重试" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
-(void)notifyMethod:(NSNotification*)notifications{
    if ([[notifications name] isEqualToString:LOGOUT]) {
        [self showLoginWindow];
    }
}
-(NSString *) urldecode:(NSMutableDictionary *) input{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:input options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString * url =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    return url;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self isNetworking];
//    [self isLogin];
    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self setWhiterColorAppNavigationBarStyle];
}
#pragma mark - 设置顶部分割线
-(void)setTopLabel{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0,kTopHeight-0.5, kScreenWidth, 0.3)];
    label.backgroundColor = [UIColor cjBackgroundColor];
    [self.view addSubview:label];
}
#pragma mark - 设置左图标
-(void)setLeftImage{
    UIImageView * image1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, kStatusBarHeight+10, 20, 20)];
    image1.image = [UIImage imageNamed:@"baizuojiantou"];
    //image.backgroundColor  = [UIColor colorWithRed:0xff/255.0 green:0x62/255.0 blue:0x11/255.0 alpha:1];
    [self.image addSubview:image1];
}
#pragma mark - 设置右上角图文按钮
-(void)setRightImage:(NSString *)aret image:(NSString * )imagel{
    
    if (!self.massageButton) {
        self.massageButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.massageButton setFrame:CGRectMake(kScreenWidth-84, kStatusBarHeight+10, 80, kNavBarHeight-20)];
        [self.massageButton addTarget:self action:@selector(RightTextClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.massageButton setTitle:aret forState:UIControlStateNormal];
        self.massageButton.titleLabel.font = UIFontMake(15);
        self.massageButton.titleLabel.textAlignment = NSTextAlignmentRight;
        [self.massageButton setImage:[UIImage imageNamed:imagel] forState:UIControlStateNormal];
//        self.massageButton.tintColor =[UIColor cjMainTextColor];
        [self.massageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.massageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        //    [CJUtil getUIButtonCutAllCornRound:self.massageButton height:5];
        [self.image addSubview:self.massageButton];
    }
    [self.massageButton setTitle:@"" forState:UIControlStateNormal];
    [self.massageButton setTitle:aret forState:UIControlStateNormal];
}

- (void)setRighttMessageBtnBackgroundColor:(UIColor *)backgroundColor{
    self.massageButton.backgroundColor = backgroundColor;
}
#pragma mark - 设置右上角图片按钮
- (void)setRightButton:(NSString *)imageName{
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(SCREEN_WIDTH-50, kStatusBarHeight, 40,40);
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 20, 20)];
    imageview.image = [UIImage imageNamed:imageName];
    //    [leftButton setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [leftButton addSubview:imageview];
    [self.image addSubview:leftButton];
    leftButton.adjustsImageWhenHighlighted = NO;
    [leftButton addTarget:self action:@selector(Rightbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 右图标按钮点击方法
-(void)Rightbuttonclick:(UIButton *)sender{
    
}
#pragma mark - 右图文按钮点击方法
- (void)RightTextClick:(UIButton *)sender{
    [self.view endEditing:NO];
}
#pragma mark - 设置顶部标题
- (void)setTitleName:(NSString *)title{
    [self.image addSubview:self.label];
    self.label.text = title;
}

- (void)setSecondAppNavigationBarStyle{
    self.image.backgroundColor = [UIColor cjWhiteColor];
    self.label.textColor = [UIColor cjMainTextColor];
    self.BackleftButton.tintColor = [UIColor cjMainTextColor];
    [self.massageButton setTitleColor:[UIColor cjMainTextColor] forState:UIControlStateNormal];
}

- (void)setWhiterColorAppNavigationBarStyle{
    self.image.backgroundColor = [UIColor cjMainColor];
    self.label.textColor = [UIColor cjWhiteColor];
    self.BackleftButton.tintColor = [UIColor cjWhiteColor];
    [self.massageButton setTitleColor:[UIColor cjWhiteColor] forState:UIControlStateNormal];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(40, kStatusBarHeight, kScreenWidth-80, kNavBarHeight)];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont cjTitleFont18];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor cjClearColor];
    }
    return _label;
}
#pragma mark - 设置左上角返回功能按钮
- (void)setBackLeftButton:(NSString *)imageName{
    
    self.BackleftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.BackleftButton.frame = CGRectMake(10, kStatusBarHeight+2, 60,40);
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 11.5, 10, 17.5)];
    UIImage *image = [UIImage imageNamed:@"zcj_arrow_back"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imageview.image = image;
    [self.BackleftButton addSubview:imageview];
    self.BackleftButton.tintColor = [UIColor cjWhiteColor];
    [self.image addSubview:self.BackleftButton];
    self.BackleftButton.adjustsImageWhenHighlighted = NO;
    [self.BackleftButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 设置左上角定制功能按钮
- (void)setLeftButton:(NSString *)imageName title:(NSString *)name{
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(10, kStatusBarHeight+2, 40,40);
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 20, 20)];
    
    UIImage *image =[UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imageview.tintColor = [UIColor cjWhiteColor];
    imageview.image = image;
    [leftButton addSubview:imageview];
    [self.image addSubview:leftButton];
    leftButton.tintColor = [UIColor cjWhiteColor];
    [leftButton setTitle:name forState:UIControlStateNormal];
    leftButton.titleLabel.textAlignment = NSTextAlignmentRight;
    leftButton.titleLabel.font = UIFontMake(16);
    leftButton.tintColor = [UIColor whiteColor];
    leftButton.adjustsImageWhenHighlighted = NO;
    [leftButton addTarget:self action:@selector(LeftClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 设置左上角定制功能按钮点击方法
- (void)LeftClick:(UIButton *)sender{
    
}
#pragma mark - 设置左上角定制功能按钮返回功能点击方法
- (void)backClick:(UIButton *)sender{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)presentVc:(UIViewController *)vc {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentVc:vc completion:nil];
}

- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion {
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    [self presentViewController:vc animated:YES completion:completion];
}

- (void)pop {
    if (self.navigationController == nil) return ;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popdelay {
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        if (self.navigationController == nil) return ;
        [self.navigationController popViewControllerAnimated:YES];
    });
}

- (void)popdelayToVc:(UIViewController *)vc{
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{

        if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
        if (self.navigationController == nil) return ;
//        [self.navigationController popToViewController:vc animated:YES];
        [self.navigationController pushViewController:vc animated:NO];
    });
}

- (void)popToRootVc {
    if (self.navigationController == nil) return ;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popToVc:(UIViewController *)vc {
    
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    [self.navigationController popToViewController:vc animated:YES];
}

- (void)pushVc:(UIViewController *)vc {

    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    if (vc.hidesBottomBarWhenPushed == NO) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clearAllUserDefaultsData{
    [CJControl clearAllUserDefaultsData];
}

- (void)popToTabVCAtIndex:(NSInteger )integer{
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    UITabBarController *tabViewController = (UITabBarController *) appDelegate.window.rootViewController;
//    tabViewController.selectedIndex = 0;
//    [tabViewController setSelectedIndex:integer];
    self.tabBarController.selectedIndex = integer;
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)popToBeforeVCAtIndex:(NSInteger )integer{
    
    NSArray <UIViewController *> *childViewControllers = self.navigationController.childViewControllers;
    
    UIViewController *vc = [childViewControllers objectAtIndex:childViewControllers.count - integer];
    if ([vc isKindOfClass:[UIViewController class]] == NO) return ;
    if (self.navigationController == nil) return ;
    if (vc.hidesBottomBarWhenPushed == NO) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController popToViewController:vc animated:YES];
}
//- (void)emptyView{
//    [self.tableView addNoteViewWithpicName:@"bg_no_grab" noteText:@"木有数据啦，请试一试下拉刷新或者检查网络连接状态" refreshBtnImg:@"nil"];
//}
- (void)dealloc{
    CJRemoveNofify;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#define mark ----- 左侧侧滑按钮去 搜索输入框

#pragma mark - 设置左上角侧滑
- (void)setLeftSliderButton:(NSString *)imageName{
    self.BackleftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.BackleftButton.frame = CGRectMake(10, kStatusBarHeight+2, 60,40);
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 20, 20)];
    UIImage *image = [UIImage imageNamed:@"my1"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imageview.image = image;
    [self.BackleftButton addSubview:imageview];
    self.BackleftButton.tintColor = [UIColor cjWhiteColor];
    [self.image addSubview:self.BackleftButton];
    self.BackleftButton.adjustsImageWhenHighlighted = NO;
    [self.BackleftButton addTarget:self action:@selector(btnLeftSliderAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnLeftSliderAction:(UIButton *)sender{
  
    [self rightClick];
}

- (void)rightClick{
    
//    if ([CJControl isLogin]) {
//        LeftViewController *vc = [[LeftViewController alloc]init];
//        [self cw_showDefaultDrawerViewController:vc];
//    } else {
//        [self showLoginWindowALert];
//    }
//
 
}

//- (void)rightClickSliderStart{
//    WS(ws);
//    // 第一个参数为是否开启边缘手势，开启则默认从边缘50距离内有效，第二个block为手势过程中我们希望做的操作
//    [self cw_registerShowIntractiveWithEdgeGesture:NO transitionDirectionAutoBlock:^(CWDrawerTransitionDirection direction) {
//        //NSLog(@"direction = %ld", direction);
//        if (direction == CWDrawerTransitionFromLeft) { // 左侧滑出
//            [ws rightClick];
//        } else if (direction == CWDrawerTransitionFromRight) { // 右侧滑出
//            
//        }
//    }];
//}

//- (void)setSearchBarOnImg{
//    [self.image addSubview:self.searchBar];
//}
//- (UISearchBar *)searchBar{
//
//    if (!_searchBar) {
//        
//        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(20, kStatusBarHeight + 5, kScreenWidth - 20 -74, kNavBarHeight - 10)];
//        _searchBar.searchBarStyle = UISearchBarStyleDefault;
//        _searchBar.placeholder = @"请输入客户或订单关键字";
//        [_searchBar setShowsCancelButton:NO];
//        _searchBar.delegate = self;
//        [_searchBar setTintColor:[UIColor cjMainTextColor]];
//        _searchBar.enablesReturnKeyAutomatically = NO; //这里设置为无文字,还可以点击
//
//        UIImage* searchBarBg = [self GetImageWithColor:[UIColor cjWhiteColor] andHeight:kNavBarHeight - 10];
//        [_searchBar setBackgroundImage:searchBarBg];
//
////        UIImage* searchBarBg1 = [self GetImageWithColor:[UIColor cjWhiteColor] andHeight:kNavBarHeight];
////        [_searchBar setSearchFieldBackgroundImage:searchBarBg1 forState:UIControlStateNormal];
//
//         UITextField *searchField;
//        if (DeviceSystemVersion.doubleValue >= 13.0) {
//
//            searchField = _searchBar.searchTextField;
//
//        } else {
//            searchField = [self.searchBar valueForKey:@"_searchField"];
//
//        }
//        searchField.backgroundColor = [UIColor cjWhiteColor];
//        _searchBar.layer.masksToBounds = YES;
//        _searchBar.layer.cornerRadius = (kNavBarHeight - 10)/2;
//    }
//    return _searchBar;
//}



//- (UITextField *)roundedRectImageViewWithCornerRadius:(CGFloat)cornerRadius {
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.path = bezierPath.CGPath;
//    self.layer.mask = layer;
//
//    return self;
//}
//- (UISearchBar *)searchBar{
//
//    if (!_searchBar) {
//        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(20, kStatusBarHeight, kScreenWidth - 20 -74, kNavBarHeight)];
//        _searchBar.searchBarStyle = UISearchBarStyleDefault;
//        _searchBar.placeholder = @"请输入客户或订单关键字";
//
//         UITextField *searchField;
//        if (DeviceSystemVersion.doubleValue >= 13.0) {
//
//            // 这里是对 13.0 以上的iOS系统进行处理
//            NSUInteger Views = [self.searchBar.subviews count];
//
//            for(int i = 0; i < Views; i++) {
//
//              if([[self.searchBar.subviews objectAtIndex:i] isKindOfClass:[UITextField class]]) {
//
//                  searchField = [self.searchBar.subviews objectAtIndex:i];
//
//              }
//
//            }
//
//           //这里设置相关属性
//
//        } else {
//
//            // 这里是对 13.0 以下的iOS系统进行处理
//            searchField = [self.searchBar valueForKey:@"_searchField"];
//
//             //这里设置相关属性
//
//        }
//
//
//        searchField.clearButtonMode = YES;
//        searchField.returnKeyType = UIReturnKeyDone;//
//
//        [_searchBar setShowsCancelButton:NO];
//        _searchBar.delegate = self;
//        [_searchBar setTintColor:[UIColor cjMainTextColor]];
//        _searchBar.enablesReturnKeyAutomatically = NO; //这里设置为无文字,还可以点击
//        _searchBar.barTintColor = [UIColor cjMainColor];
//        [_searchBar setBackgroundImage:[UIImage new]];
//
//        _searchBar.backgroundColor = [UIColor cjWhiteColor];
//
//
//
//    }
//    return _searchBar;
//}


//#pragma mark - 实现键盘上Search按钮的方法
//
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
//    
//    NSLog(@"您点击了键盘上的Search按钮");
//    [self.searchBar resignFirstResponder];
//    
//}
//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    NSLog(@"点击了搜索");
//    return YES;
//}

- (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}


-(void)showLoginWindow
{
    [CJControl clearAllUserDefaultsData];
    LogInVC *vc = [[LogInVC alloc] init];
    [self pushVc:vc];
//    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
//    if ([viewController.presentedViewController isKindOfClass:[UINavigationController class]]) {
//        UINavigationController *navigation = (id)viewController.presentedViewController;
//        if ([navigation.topViewController isKindOfClass:[LogInVC class]]) {
//            return;
//        }
//    }
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
//
//    [self presentViewController:navi animated:YES completion:^{
//
//    }];
}
- (void)showLoginWindowALert{
    
    WS(ws);
    CJAlertView *alert = [[CJAlertView alloc]initWithTitle:@"友情提示" strContent:@"您还没有登录！" ClickOnSure:^(NSString * _Nonnull strSure) {
      [ws showLoginWindow];
    } ClickOnCancle:^(NSString * _Nonnull strCancle) {
     
    }];
    alert.center = KEYWINDOW.center;
    [alert setSureTitle:@"去登录"];
    WLAlertView * alertView = [[WLAlertView alloc]init];
    alertView.containerView = alert;
    //     alertView.transitionStyle=WLAlertViewTransitionStyleSlideFromBottom;
    
    [alertView show];

}


- (void)showAlertView:(NSString *)strTitle strContent:(NSString *)strContent  ClickOnSure:(OnSureClick )sureClick ClickOnCancle:(OnCancleClick )cancleClick{
    
    WS(ws);
    CJAlertView *alert = [[CJAlertView alloc]initWithTitle:strTitle strContent:strContent ClickOnSure:^(NSString * _Nonnull strSure) {
        ws.sureBlock = sureClick;
        if (ws.sureBlock) {
            ws.sureBlock(@"");
        }
    } ClickOnCancle:^(NSString * _Nonnull strCancle) {

    }];
    alert.center = KEYWINDOW.center;
    WLAlertView * alertView = [[WLAlertView alloc]init];
    alertView.containerView = alert;
    alertView.isTouchOtherUndissmiss = YES;
    [alertView show];
}



@end
