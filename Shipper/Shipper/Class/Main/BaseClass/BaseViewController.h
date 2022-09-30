//
//  BaseViewController.h
//  TMSDriver
//
//  Created by admin on 2018/3/6.
//  Copyright © 2018年 admin All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OnSureClick)(NSString *strSure);
typedef void (^OnCancleClick)(NSString *strCancle);
@interface BaseViewController : UIViewController
@property(strong,nonatomic)   UIImageView * image;
@property(strong,nonatomic)   UILabel * label;
@property(strong,nonatomic)   UIButton *BackleftButton;
@property(strong,nonatomic)   UIButton * massageButton;
//@property (nonatomic,strong) UIButton *btnLeftSlider;  // 左侧侧滑按钮
//@property (nonatomic,strong) UISearchBar *searchBar;
//@property (nonatomic,copy) NSString *strSearchBarText; // 输入的文本内容

#pragma mark - 设置顶部标题
- (void)setTitleName:(NSString *)title;
#pragma mark - 设置左上角返回功能按钮
- (void)setBackLeftButton:(NSString *)imageName;
#pragma mark - 设置左上角定制功能按钮
- (void)setLeftButton:(NSString *)imageName title:(NSString *)name;
#pragma mark - 设置左图标
- (void)setLeftImage;
#pragma mark - 设置右上角图文按钮
-(void)setRightImage:(NSString *)text image:(NSString * )imageName;
- (void)setRighttMessageBtnBackgroundColor:(UIColor *)backgroundColor;
-(void)setTopLabel;
#pragma mark - 设置右上角图片按钮
- (void)setRightButton:(NSString *)imageName;
#pragma mark - 右图标按钮点击方法
-(void)Rightbuttonclick:(UIButton *)sender;
#pragma mark - 右图文按钮点击方法
- (void)RightTextClick:(UIButton *)sender;
#pragma mark - 设置左上角定制功能按钮点击方法
- (void)LeftClick:(UIButton *)sender;
#pragma mark - 返回上一页
- (void)pop;
#pragma mark - 延时返回上一页
- (void)popdelay;
#pragma mark ----- 延时返回指定页面
- (void)popdelayToVc:(UIViewController *)vc;
#pragma mark - 返回父类页面
- (void)popToRootVc;
#pragma mark - 返回某一特定页面
- (void)popToVc:(UIViewController *)vc;
//- (void)keyBoardHide;
#pragma mark - 返回某一特定TabVCA
- (void)popToTabVCAtIndex:(NSInteger )integer;
#pragma mark - 返回上上曾控制

- (void)popToBeforeVCAtIndex:(NSInteger )integer;
-(void)showLoginWindow;
- (void)pushVc:(UIViewController *)vc;
-(NSString *)urldecode:(NSMutableDictionary *) input;
//-(BOOL)isLogin;

// clear users
- (void)clearAllUserDefaultsData;

//- (void)setSecondAppNavigationBarStyle;
- (void)setWhiterColorAppNavigationBarStyle;

#define mark ----- 左侧侧滑按钮去 搜索输入框


#pragma mark - 设置左上角侧滑
/**
 设置左上角侧滑

 @param imageName <#imageName description#>
 */
//- (void)setLeftSliderButton:(NSString *)imageName;

/**
 开启抽屉效果
 */
//- (void)rightClickSliderStart;
//- (void)setSearchBarOnImg;

/// 去登陆提示
- (void)showLoginWindowALert;


- (void)showAlertView:(NSString *)strTitle strContent:(NSString *)strContent  ClickOnSure:(OnSureClick )sureClick ClickOnCancle:(OnCancleClick )cancleClick;

- (void)base_bindViewModel;
@end
