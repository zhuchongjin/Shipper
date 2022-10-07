//
//  SearchView.h
//  Shipper
//
//  Created by zcj on 2022/10/7.
//  Copyright © 2022 admin. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchView : BaseView
@property (nonatomic,copy) CJBlock blockSearch;/**<  <#Description#> */
@property (nonatomic,copy) NSString *placeholder;/**<  <#Description#> */
@end

NS_ASSUME_NONNULL_END
