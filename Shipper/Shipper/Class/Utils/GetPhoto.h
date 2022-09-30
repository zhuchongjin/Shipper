//
//  GetPhoto.h
//  PolyCarCollect
//
//  Created by liangboshuo on 15/7/9.
//  Copyright (c) 2015年 liangboshuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetPhoto : NSObject<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>

+ (void)getPhoto:(UIViewController *)controller completion:(void (^)(UIImage* curImage,NSData * imageData))completion;

//修改字体颜色
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet;

@end
