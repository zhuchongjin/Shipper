//
//  GetPhoto.m
//  PolyCarCollect
//
//  Created by liangboshuo on 15/7/9.
//  Copyright (c) 2015年 liangboshuo. All rights reserved.
//

#import "GetPhoto.h"

@interface GetPhoto ()
{
    UIViewController * curController;
    void (^finishBlock)(UIImage* curImage,NSData * imageData);
}
@end

@implementation GetPhoto
+ (GetPhoto *)sharedInstance
{
    static GetPhoto *sharedGetPhotoInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedGetPhotoInstance = [[self alloc] init];
    });
    return sharedGetPhotoInstance;
}
+(void)getPhoto:(UIViewController *)controller completion:(void (^)(UIImage *, NSData *))completion
{
    [[self sharedInstance] getPhotoWithControler:controller completion:completion];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)getPhotoWithControler:(UIViewController *)controller completion:(void (^)(UIImage *, NSData *))completion
{
    curController = controller;
    finishBlock = completion;
    [self getCameaPicture];
}

#pragma mark 相册
- (void)getCameaPicture
{

    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册中选择", nil];

    [sheet showInView:curController.view];
}

//修改字体颜色
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    for (UIView *subViwe in actionSheet.subviews) {
        if ([subViwe isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton*)subViwe;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
}

#pragma mark - actionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    /*
     0 拍照
     1 相册
     2 取消
     */
    switch (buttonIndex) {
        case 0:
        {
            //拍照
            [self takePhoto];
        }
            break;
        case 1:
        {
            //相册
            [self LocalPhoto];
        }
            break;
        case 2:
        {
            //取消
        }
            break;
            
        default:
            break;
    }
}


//开始拍照
- (void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        [[picker navigationBar] setBarTintColor:[UIColor whiteColor]];
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.sourceType = sourceType;
        [curController presentViewController:picker animated:YES completion:^{
            
        }];
    }else
    {
        DLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

//打开本地相册
- (void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //更改背景颜色
    [[picker navigationBar] setBarTintColor:[UIColor cjMainColor]];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    [curController presentViewController:picker animated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"])
    {
        UIImage * image;
        if (picker.allowsEditing) {
            image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        }else
        {
            image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        }

        NSData * imageData = UIImageJPEGRepresentation(image, 0.05);
        
        if (finishBlock) {
            finishBlock(image,imageData);
        }
        
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
