//
//  LogInVC.m
//  TMSDriver
//
//  Created by mac on 2019/5/14.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "LogInVC.h"
@interface LogInVC ()

@end

@implementation LogInVC
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitleName:@"登录"];
  
    #ifdef DEBUG
//        self.fieldAccount.text =   @"15500004445";  //@"17750000004"; @"17756100004";//
//        self.fieldPW.text = @"Admin@123";
    #else
        // Release 模式的代码...
    #endif
}


@end
