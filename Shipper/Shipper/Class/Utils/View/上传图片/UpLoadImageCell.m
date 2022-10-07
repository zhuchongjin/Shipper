//
//  UpLoadImageCell.m
//  NtoccShipper
//
//  Created by zcj on 2021/3/31.
//  Copyright © 2021 zhuchongjin. All rights reserved.
//

#import "UpLoadImageCell.h"

@interface UpLoadImageCell()
@property(nonatomic,strong) UILabel* label;
@property(nonatomic,strong) UIImageView* image;
@property (nonatomic,strong) UIImageView *imgVBG;
@property (nonatomic,strong) UIImageView *imgVPhotoMoRen;
@property (nonatomic,strong) UILabel *labIndexText;
@property (nonatomic,strong) CJButton *btnDelete;
@end

@implementation UpLoadImageCell

-(void)setText:(NSString*)text{
    self.label.text = text;
}

- (void)setCellWithModel:(UploadImgModel *)model index:(NSInteger )index arrSum:(NSInteger) indexSum isOnlyShow:(BOOL )onlyShow{

    //
    [self.imgVBG addSubview:self.btnDelete];
    [self.imgVBG sd_setImageWithURL:[NSURL URLWithString:model.strImgUrl]];
    
    if ([model.strImgUrl isEqualToString:@""]  || index + 1 == indexSum) {
        self.imgVPhotoMoRen.hidden = NO;
        self.labIndexText.hidden = NO;
        self.labIndexText.text = model.strTitle;
        
        if (index == 0) {
            self.labIndexText.text = @"添加照片";
//            self.btnDelete.hidden = YES;
        }
//        else if (index == 1){
//            self.labIndexText.text = @"装货交接单";
////            self.btnDelete.hidden = YES;
//        }else if (index == 2){
//            self.labIndexText.text = @"添加照片";
////            self.btnDelete.hidden = YES;
//        }
        else{
            self.labIndexText.text = CJStringWithFormat(@"%ld/9",(long)indexSum);
        }
        
    }else{
        self.imgVPhotoMoRen.hidden = YES;
        self.labIndexText.hidden = YES;
//        self.labIndexText.text = model.strTitle;
    }
    
//    if (index < 2 || index == indexSum -1) {
//        self.btnDelete.hidden = YES;
//
//    }else{
//        self.btnDelete.hidden = NO;
//
//    }
    
    self.btnDelete.hidden = model.hideDeleteImg;
    if (index == indexSum -1) {
        self.btnDelete.hidden = YES;
    }
    
    
    if(onlyShow){
        self.btnDelete.hidden = YES;
        self.imgVPhotoMoRen.hidden = YES;
        self.labIndexText.hidden = YES;
    }
    
}

- (CJButton *)btnDelete{
    if (!_btnDelete) {
        _btnDelete = CJButton.btnInit
        .btnFrame(CGRectMake(60, 0, 20, 20))
//        .btnBgColor([UIColor cjRe÷dColor])
        .btnTargetAction(self,@selector(btnDeleteImgVAction))
        .btnSelectImgName(@"delete_img")
        .btnNormalImgName(@"delete_img")
        ;
    }
    return _btnDelete;
}

- (void)btnDeleteImgVAction{
    DLog(@"=======");
    
    if (self.blockDelete) {
        self.blockDelete(@"");
    }
}
@end
