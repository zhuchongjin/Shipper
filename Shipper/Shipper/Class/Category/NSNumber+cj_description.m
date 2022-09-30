//
//  NSNumber+cj_description.m
//  CMTSShipper
//
//  Created by mac on 2020/3/24.
//  Copyright © 2020 admin. All rights reserved.
//

#import "NSNumber+cj_description.h"

@implementation NSNumber (cj_description)

- (NSString *)cj_desc{

    //直接传入精度丢失有问题的Double类型
    //        double conversionValue = [str doubleValue];
    NSString *doubleString = [NSString stringWithFormat:@"%0.3f", [self doubleValue]];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];

}
- (NSString *)cj_money_desc{
//    DLog(@"==== %f",[self floatValue]);
    NSString *doubleString = [NSString stringWithFormat:@"%0.2f", [self doubleValue]];
//    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
//    return [decNumber stringValue];
    return doubleString;;
}

-(NSString *)notRounding:(float)price afterPoint:(int)position{
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:price];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
//    [ouncesDecimal release];
    return [NSString stringWithFormat:@"%@",roundedOunces];
}



@end
