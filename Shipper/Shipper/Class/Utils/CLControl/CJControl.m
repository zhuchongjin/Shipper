//
//  CJControl.m
//  TMSDriver
//
//  Created by mac on 2019/2/12.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "CJControl.h"
#import "GTMBase64.h"
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>
#import <SAMKeychain/SAMKeychain.h>
@implementation CJControl

+(void)clearAllUserDefaultsData{

    NSUserDefaults*userDefaults = [NSUserDefaults  standardUserDefaults];
    NSDictionary*dic = [userDefaults  dictionaryRepresentation];
    for(id key in dic) {
        
//        if ([key isEqualToString:CJMainURLChange]) {
//
//        }else{
//            [userDefaults  removeObjectForKey:key];
//        }
        
    }
   [userDefaults  synchronize];
}




+ (NSString *)getDeviceUUID{
    NSString *appName=[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
    NSString *strApplicationUUID =  [SAMKeychain passwordForService:appName account:@"Shipper"];
    
    if (strApplicationUUID == nil){
        strApplicationUUID  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        NSError *error = nil;
        SAMKeychainQuery *query = [[SAMKeychainQuery alloc] init];
        query.service = appName;
        query.account = @"Shipper";
        query.password = strApplicationUUID;
        query.synchronizationMode = SAMKeychainQuerySynchronizationModeNo;
        [query save:&error];
    }
    return strApplicationUUID;
}


#pragma mark - base64加密
+ (NSString *) base64:(NSString *) input{
    NSData * data = [input dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    data = [GTMBase64 encodeData:data];
    NSString * output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return output;
}
#pragma mark - md5加密
+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}




+(NSString *)convertToJsonData:(NSArray *)dict{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    
    if (!jsonData) {
        DLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    //     [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    //     NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range];
    
    return mutStr;
    
}


#pragma mark ----------huoqu tuopian ju-----------

+ (NSString *)getImgFilePath:(UIImage *)img{
    
   
    NSString *fileName = [CJControl saveImage:[CJControl scaleImage:img newSize:CGSizeMake(100, 100)] WithName:[NSString stringWithFormat:@"%@%@",[CJControl generateUuidString],@".jpg"]];
    return fileName;
}

/**
 * 修改图片大小
 */
+ (UIImage *) scaleImage:(UIImage*)image newSize:(CGSize) newSize{
    //    newSize.height=image.size.height*(newSize.width/image.size.width);
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  newImage;
}


/**
 * 保存图片
 */
+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName{
    NSData* imageData;
    
    //判断图片是不是png格式的文件
    if (UIImagePNGRepresentation(tempImage)) {
        //返回为png图像。
        imageData = UIImagePNGRepresentation(tempImage);
    }else {
        //返回为JPEG图像。
        imageData = UIImageJPEGRepresentation(tempImage, 1.0);
    }
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    DLog(@"%@",paths[0]);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    
    NSArray *nameAry=[fullPathToFile componentsSeparatedByString:@"/"];
    DLog(@"===fullPathToFile===%@",fullPathToFile);
    DLog(@"===FileName===%@",[nameAry objectAtIndex:[nameAry count]-1]);
    
    [imageData writeToFile:fullPathToFile atomically:NO];
    return fullPathToFile;
}

/**
 * 生成GUID
 */
+ (NSString *)generateUuidString{
    // create a new UUID which you own
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    
    // create a new CFStringRef (toll-free bridged to NSString)
    // that you own
    NSString *uuidString = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
    
    // transfer ownership of the string
    // to the autorelease pool
    //[uuidString autorelease];
    
    // release the UUID
    CFRelease(uuid);
    
    return uuidString;
}


+(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    NSLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
    
}



+(NSString *)convertToJsonDataFromDic:(NSDictionary *)dict{
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        DLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
//    NSRange range = {0,jsonString.length};
    
    
    //去掉字符串中的空格
    
//    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
//         NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    NSRange range1 = {0,mutStr.length};

    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range1];
    
    return mutStr;
    
}
+(NSString *)convertToJsonDataFromArray:(NSArray *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    
    if (!jsonData) {
        DLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    //     [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    //     NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range];
    
    return mutStr;
    
}

+ (NSString *)getString:(id)idx{
    
     NSString *str = CJStringWithFormat(@"%@",idx);
     if (IsNilOrNull(idx) ||[str isEqualToString:@"null"] ||[str isEqualToString:@"(null)"] ||[str isEqualToString:@"NULL"] ||[str isEqualToString:@"(NULL)"] ||[str isEqualToString:@"nil"] ||[str isEqualToString:@"(nil)"] ||[str isEqualToString:@"NIL"] ||[str isEqualToString:@"(NIL)"]) {
         return @"";
     }else{
         return str;
     }
}


+ (BOOL)getIsEmpty:(id)idx{
    
     NSString *str = CJStringWithFormat(@"%@",idx);
     if (IsNilOrNull(idx) ||[str isEqualToString:@"null"] ||[str isEqualToString:@"(null)"] ||[str isEqualToString:@"NULL"] ||[str isEqualToString:@"(NULL)"] ||[str isEqualToString:@"nil"] ||[str isEqualToString:@"(nil)"] ||[str isEqualToString:@"NIL"] ||[str isEqualToString:@"(NIL)"]) {
         return YES;
     }else{
         return NO;
     }
}

+ (NSArray *)componentsSeparatedByString:(NSString *)str withSign:(NSString *)sign{
    return [str componentsSeparatedByString:sign];
}

+ (NSString *)stringByReplacingOccurrencesOfString:(NSString *)str{
    
    return [str stringByReplacingOccurrencesOfString:@"," withString:@""];
}


/**
 *  通过 CAShapeLayer 方式绘制虚线
 *
 *  param lineView:       需要绘制成虚线的view
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 *  param lineDirection   虚线的方向  YES 为水平方向， NO 为垂直方向
 **/
+ (void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal {

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];

    [shapeLayer setBounds:lineView.bounds];

    if (isHorizonal) {

        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];

    } else{
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame)/2)];
    }

    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    if (isHorizonal) {
        [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    } else {

        [shapeLayer setLineWidth:CGRectGetWidth(lineView.frame)];
    }
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);

    if (isHorizonal) {
        CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    } else {
        CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(lineView.frame));
    }

    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}


//+ (UIImage *)addWatermarkToPicture:(UIImage *)image withLoaction:(NSString *)locationString {
//    
////    CGSize imageSize = CGSizeMake(image.size.width, image.size.height);
////    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
////    [image drawAtPoint:CGPointZero];
////    NSString *date = [CJControl getCurrentTimes];
////    NSString *location = locationString;
////    [date drawAtPoint:CGPointMake(imageSize.width - 300, imageSize.height - 100) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor cjMainColor]}];
////    [location drawAtPoint:CGPointMake(imageSize.width - 500, imageSize.height - 50) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor cjMainColor]}];
////    image = UIGraphicsGetImageFromCurrentImageContext();
////    UIGraphicsEndImageContext();
////
////    return image;
//    
//    
//     int w = image.size.width;
//     int h = image.size.height;
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    //create a graphic context with CGBitmapContextCreate
//    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
//    CGContextDrawImage(context, CGRectMake(0, 0, w, h), image.CGImage);
//    CGContextSetRGBFillColor(context, 0.0, 1.0, 1.0, 1);
//    char* text = (char *)[locationString cStringUsingEncoding:NSASCIIStringEncoding];
//    CGContextSelectFont(context, "Georgia", 30, kCGEncodingMacRoman);
//    CGContextSetTextDrawingMode(context, kCGTextFill);
//    CGContextSetRGBFillColor(context, 255, 0, 0, 1);
//    CGContextShowTextAtPoint(context, w/2-strlen(text)*5, h/2, text, strlen(text));
//    //Create image ref from the context
//    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
//    CGContextRelease(context);
//    CGColorSpaceRelease(colorSpace);
//    return [UIImage imageWithCGImage:imageMasked];
//    
//}


//+ (UIViewController *)getCurrentViewController{
//
//    UIViewController* currentViewController = [CJControl getRootViewController];
//    BOOL runLoopFind = YES;
//    while (runLoopFind) {
//        if (currentViewController.presentedViewController) {
//
//            currentViewController = currentViewController.presentedViewController;
//        } else if ([currentViewController isKindOfClass:[UINavigationController class]]) {
//
//          UINavigationController* navigationController = (UINavigationController* )currentViewController;
//            currentViewController = [navigationController.childViewControllers lastObject];
//
//        } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
//
//          UITabBarController* tabBarController = (UITabBarController* )currentViewController;
//            currentViewController = tabBarController.selectedViewController;
//        } else {
//
//            NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
//            if (childViewControllerCount > 0) {
//
//                currentViewController = currentViewController.childViewControllers.lastObject;
//
//                return currentViewController;
//            } else {
//
//                return currentViewController;
//            }
//        }
//
//    }
//    return currentViewController;
//}

//+ (UIViewController *)getRootViewController{
//
//    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
//    NSAssert(window, @"The window is empty");
//    return window.rootViewController;
//}

+(NSString *)replaceStringWithAsterisk:(NSString *)originalStr startLocation:(NSInteger)startLocation lenght:(NSInteger)lenght{

    NSString *newStr = originalStr;

    for (int i = 0; i < lenght; i++) {

        NSRange range = NSMakeRange(startLocation, 1);

        newStr = [newStr stringByReplacingCharactersInRange:range withString:@"*"];

        startLocation ++;

    }

    return newStr;

}



@end
