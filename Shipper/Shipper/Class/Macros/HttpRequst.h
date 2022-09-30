//
//  HttpRequst.h
//  临沂
//
//  Created by zcj on 2017/11/10.
//  Copyright © 2017 xiaoruiyun.com. All rights reserved.
//

#ifndef HttpRequst_h
#define HttpRequst_h

#define ApraBaseUrl            @"http://120.224.237.214:31982"
#define BranchCode             @"27adb23841d547b8ae6f0c11481b4cfd"
#define JPushKey               @"f9bc6e0e4e6b49047e31b699"
#define BDMapKey               @"VeSbZf54d6zyGUhKXjKUiSGjn9viB1yy"

// 项目开发模式   上架屏蔽掉
#define IsDebugDevelopmentModel

#ifdef IsDebugDevelopmentModel
    #define CJBaseUrl   [CJControl getIsEmpty:CJFetchMyDefault(CJMainURLChange)] ? ApraBaseUrl:CJFetchMyDefault(CJMainURLChange)
#else
    #define CJBaseUrl    ApraBaseUrl
#endif


#endif /* HttpRequst_h */
