//
//  UpLoadImageCell.h
//  NtoccShipper
//
//  Created by zcj on 2021/3/31.
//  Copyright © 2021 zhuchongjin. All rights reserved.
//

#import <FlexLib/FlexLib.h>
#import "UploadImgModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UpLoadImageCell : FlexCollectionCell
-(void)setText:(NSString*)text;

//- (void)setCellWithModel:(UploadImgModel *)model index:(NSInteger )index;
- (void)setCellWithModel:(UploadImgModel *)model index:(NSInteger )index arrSum:(NSInteger) indexSum isOnlyShow:(BOOL )onlyShow;
@property (nonatomic,copy) CJBlock blockDelete;
@end

NS_ASSUME_NONNULL_END
