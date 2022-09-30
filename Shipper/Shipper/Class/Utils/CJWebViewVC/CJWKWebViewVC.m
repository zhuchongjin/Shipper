//
//  CJWKWebViewVC.m
//  Shipper
//
//  Created by mac on 2019/12/27.
//  Copyright © 2019 admin. All rights reserved.
//

#import "CJWKWebViewVC.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@interface CJWKWebViewVC ()<WKScriptMessageHandler, WKUIDelegate, WKNavigationDelegate>
@property (nonatomic,strong)WKWebView *wkWebView;
@end

@implementation CJWKWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitleName:self.strTitle];
    [self setBackLeftButton:@""];
    [self.view addSubview:self.wkWebView];
    
    if (self.useUTF8) {

        NSURL *url = [NSURL URLWithString: [self.strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.wkWebView loadRequest:request];
        
    }else{
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.strUrl]];
        [self.wkWebView loadRequest:request];
    }
    
}

#pragma mark - WKScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
     
     //          NSLog(@"name:%@\\\\n body:%@\\\\n frameInfo:%@\\\\n",message.name,message.body,message.frameInfo);
     //用message.body获得JS传出的参数体
     
//     //JS调用OC
//     if([message.name isEqualToString:@"phoneBackButtonListener"]){
//
//          DLog(@"++++++ %@",message.body);
//          if ([message.body isEqualToString:@"true"]) {
//               // 返回上一层
//               if (self.navigationController == nil) return ;
//               [self.navigationController popViewControllerAnimated:YES];
//
//          }
//
//     }
//
//     if([message.name isEqualToString:@"getResponseTicket"]){
//
//          DLog(@"++++++ %@",message.body);
//          // 存在本地
//          NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
//          [userInfo setObject:message.body forKey:@"ticket"];
//          [userInfo synchronize];
//
//     }
     
}

- (WKWebView *)wkWebView{
     if(_wkWebView == nil){
          
//         WKWebViewConfiguration *webConfiguration = [WKWebViewConfiguration new];
//         _wkWebView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds configuration:webConfiguration];
//         NSString *urlStr = @"https://www.so.com";
//         NSURL *url = [NSURL URLWithString:urlStr];
//         NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//         [_wkWebView loadRequest:request];

         // 创建网页配置对象
          WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
          // 创建设置对象
          WKPreferences *preference = [[WKPreferences alloc]init];
          //最小字体大小 当将javaScriptEnabled属性设置为NO时，可以看到明显的效果
          preference.minimumFontSize = 10;
          //设置是否支持javaScript 默认是支持的
          preference.javaScriptEnabled = YES;
          // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
          preference.javaScriptCanOpenWindowsAutomatically = NO;
          config.preferences = preference;

          WKUserContentController * wkUController = [[WKUserContentController alloc] init];
          config.userContentController = wkUController;

          //以下代码适配文本大小
          NSString *jSString = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
          //用于进行JavaScript注入
          WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
          [config.userContentController addUserScript:wkUScript];

          _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight - kTopHeight) configuration:config];
          // UI代理
//          _wkWebView.UIDelegate = self;
          // 导航代理
//          _wkWebView.navigationDelegate = self;
          // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
          _wkWebView.allowsBackForwardNavigationGestures = YES;
          //可返回的页面列表, 存储已打开过的网页
          //          WKBackForwardList * backForwardList = [_wkWebView backForwardList];

//          NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.strUrl]];

//          request.timeoutInterval=5.0;//设置请求超时为5秒
//          request.HTTPMethod=@"GET";//设置请求方法
//          WKUserContentController *userCC = config.userContentController;
//          //JS调用OC 添加处理脚本
//          [userCC addScriptMessageHandler:self name:@"phoneBackButtonListener"];
//          [userCC addScriptMessageHandler:self name:@"getResponseTicket"];
//          [_wkWebView loadRequest:request];
         
     }
     return _wkWebView;
}


- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
     
//     NSMutableURLRequest *mutableRequest =   navigationAction.request;
//     NSDictionary *requestHeaders = navigationAction.request.allHTTPHeaderFields;
//
//     if(requestHeaders[@"x-from"]){
//          decisionHandler(WKNavigationActionPolicyAllow);//允许跳转
//
//     }else{
//
//          if (strInt == 1) {
//               [mutableRequest setValue:IsNilOrNull(getXAuthAoken) ? @"":getXAuthAoken forHTTPHeaderField:@"x-auth-token"];
//               [mutableRequest setValue:@"api" forHTTPHeaderField:@"x-from"];
//               [mutableRequest setValue:IsNilOrNull(getTicket) ? @"":getTicket forHTTPHeaderField:@"ticket"];
//
//               [webView loadRequest:mutableRequest];
//
//               DLog(@"+++++++++ %@ ------%@",getXAuthAoken,getTicket);
//          }
//
//          strInt++;
//
//          decisionHandler(WKNavigationActionPolicyAllow);//允许跳转
//
//     }
//
}


@end
