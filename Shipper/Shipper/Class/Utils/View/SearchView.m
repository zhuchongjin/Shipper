//
//  SearchView.m
//  Shipper
//
//  Created by zcj on 2022/10/7.
//  Copyright © 2022 admin. All rights reserved.
//

#import "SearchView.h"
@interface SearchView()
@property (nonatomic,strong) UITextField *tfSearch;/**<  <#Description#> */


@end
@implementation SearchView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}


- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.tfSearch.placeholder = placeholder;
}

#pragma mark ----------touchAction

- (void)touchSearchInfoAction{
    if(self.blockSearch){
        self.blockSearch(@"");
    }
}

@end
