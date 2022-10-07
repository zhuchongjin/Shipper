//
//  UpLoadImageView.m
//  Shipper
//
//  Created by zcj on 2022/10/7.
//  Copyright © 2022 admin. All rights reserved.
//

#import "UpLoadImageView.h"
#import "UpLoadImageCell.h"
#import "UploadImgModel.h"
#import "XLImageViewer.h"
#import "GetPhoto.h"
static NSString* reuseCellIdentifier = @"UpLoadImageCell";
@interface UpLoadImageView()<UICollectionViewDelegate,
UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) NSMutableArray *listImgsMod;/**<  <#Description#> */
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIView *viewBG;/**<  <#Description#> */


@end
@implementation UpLoadImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.viewBG addSubview:self.collectionView];
        
    }
    return self;
}


- (void)setDefaultHeigt:(BOOL)setDefaultHeigt{
    _setDefaultHeigt = setDefaultHeigt;
    if(setDefaultHeigt){
        self.viewBG.height = 100;
    }
}

- (void)setSetShowImg:(BOOL)setShowImg{
    _setShowImg = setShowImg;
    
    [self loadData];
}

- (void)setListImgUrl:(NSMutableArray *)listImgUrl{
    _listImgUrl = listImgUrl;
    [self loadData];
}
- (void)loadData{
    
    [self.listImgsMod removeAllObjects];

    if(self.setShowImg){
        
        for (int i = 0; i < self.listImgUrl.count; i++) {
            UploadImgModel *model = [[UploadImgModel alloc]init];
            model.strImgUrl = self.listImgUrl[i];
            model.strTitle = @"";
            model.changeImg = NO;
            model.hideDeleteImg = YES;
            [self.listImgsMod addObject:model];
        }
        
    }else{
        for (int i = 0; i < 1; i++) {
            UploadImgModel *model = [[UploadImgModel alloc]init];
            model.strImgUrl = @"";
            model.strTitle = @"";
            model.changeImg = NO;
            model.hideDeleteImg = YES;
            [self.listImgsMod addObject:model];
        }
        
    }
//    [self.collectionView reloadData];
    [self upDateViewHeight];
    
}

#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (self.listImgsMod.count >= 10) {
        return 9;
    }else{
        return self.listImgsMod.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UpLoadImageCell *cell = (UpLoadImageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseCellIdentifier forIndexPath:indexPath];
    
    UploadImgModel *model = self.listImgsMod[indexPath.row];
    [cell setCellWithModel:model index:indexPath.row arrSum:self.listImgsMod.count isOnlyShow:self.setShowImg];
    @weakify(self);
    cell.blockDelete = ^(id anyObject) {
        @strongify(self);
        [self.listImgsMod removeObjectAtIndex:indexPath.row];
        [self upDateViewHeight];
    };
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UploadImgModel *model = self.listImgsMod[indexPath.row];
    if ((model.changeImg && [model.strImgUrl isNotBlank]) || self.setShowImg) {
//        ShowMessage(@"查看大图");
        [self selelctChangeImgVOrSeeBigPicWitnIndex:indexPath.row isAdd:NO];
    } else {
        [self btnUploadImgVWitnIndex:self.listImgsMod.count -1 isAdd:YES];
        
    }
    
//    UploadImgModel *modInfo = self.arrModel[indexPath.row];
//
//    if (modInfo.changeImg && ![modInfo.strImgUrl isEqualToString:@""]) {
//        [self selelctChangeImgVOrSeeBigPicWitnIndex:indexPath.row isLast:NO];
//    }else{
//
//        if (self.arrModel.count == 10) {
//            DLog(@"========")
//            [CJAlert showStringDismissWithDelay:@"最多只能上传9张图片"];
//            return;
//        }
//        if (indexPath.row + 1 == self.arrModel.count) {
//            UploadImgModel *model = [[UploadImgModel alloc]init];
//
//            model.changeImg = NO;
//            [self.arrModel addObject:model];
//            DLog(@"===== 点击最后一个");
//        }
//        [self btnUploadImgVWitnIndex:indexPath.row isLast:NO];
//    }
}



//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 80);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}


#pragma mark ----------上传图片相关

// 上传图片
- (void)btnUploadImgVWitnIndex:(NSInteger )index isAdd:(BOOL)isAdd{
    
    
//    [GetPhoto getPhoto:self completion:^(UIImage *curImage, NSData *imageData) {
//
////        [ws upLoadReturnImageUImage:curImage withNSData:imageData withIndex:index isLast:isLast];
//    }];
    
    if (isAdd) {
        UploadImgModel *model = [[UploadImgModel alloc]init];
        model.changeImg = YES;
        model.strImgUrl = @"https://uploadfile.huiyi8.com/2015/0309/20150309021225406.jpg";
        [self.listImgsMod insertObject:model atIndex:index];
    } else {
        
        UploadImgModel *model = self.listImgsMod[index];
        model.strImgUrl = @"https://img.win3000.com/m00/8d/d6/58c06013f6538ff456ee0cf419c74c3b_c_345_458.jpg";
        [self.listImgsMod replaceObjectAtIndex:index withObject:model];
    }
    
    [self upDateViewHeight];
}


- (void)selelctChangeImgVOrSeeBigPicWitnIndex:(NSInteger )index isAdd:(BOOL )isAdd{
    
    @weakify(self);
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *change = [UIAlertAction actionWithTitle:@"更换照片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [ws uploadImgV];
        @strongify(self);
//        [self btnUploadImgVWitnIndex:index isLast:isLast];
        [self btnUploadImgVWitnIndex:index isAdd:isAdd];
    }];
    UIAlertAction *seeBig = [UIAlertAction actionWithTitle:@"查看大图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        @strongify(self);
        [[XLImageViewer shareInstanse] showNetImages:[self getArrImgsWitHArrModel:self.listImgsMod] index:index fromImageContainer:self];
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:NO completion:^{
        }];
    }];


    if(self.setShowImg){
        
    } else{
        [alertVC addAction:change];
    }
    
    [alertVC addAction:seeBig];
    [alertVC addAction:cancle];
    [[FunTool getCurrentViewController] presentViewController:alertVC animated:YES completion:nil];
}
- (NSMutableArray *)getArrImgsWitHArrModel:(NSMutableArray *)arr{
    
    NSMutableArray *arrImgs = [[NSMutableArray alloc]init];
    NSUInteger y ;
    if (arr.count >9) {
        y = 9;
    }else{
        y = arr.count;
    }
    
    for (int i = 0; i < y; i++) {
        UploadImgModel *model = arr[i];
        if ([model.strImgUrl isNotBlank]){
            [arrImgs addObject:model.strImgUrl];
        }
    }
    return arrImgs;
}


/// 更新高度
- (void)upDateViewHeight{
    
    CGFloat colllectionH = 100;
    
    if (self.listImgsMod.count <= 3) {
        colllectionH = 100;
    } else if(self.listImgsMod.count >3 && self.listImgsMod.count <= 6) {
        colllectionH = 200;
    }else{
        colllectionH = 300;
    }
    self.collectionView.frame = CGRectMake(15, 0, kScreenWidth -30, colllectionH);
    self.viewBG.height = self.collectionView.height;
    
    [self.viewBG layoutIfNeeded];
    [self layoutIfNeeded];
    [self.collectionView reloadData];

    if(self.blockHeight){
        self.blockHeight(self.collectionView.height);
    }
}

#pragma mark ----------lazy
- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView =[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = CGRectMake(15, 0, kScreenWidth -30, 100);
        [_collectionView registerClass:UpLoadImageCell.class forCellWithReuseIdentifier:reuseCellIdentifier];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor cjWhiteColor];
        
    }
    return _collectionView;
}

- (NSMutableArray *)listImgsMod{
    if (!_listImgsMod) {
        _listImgsMod = [[NSMutableArray alloc]init];
    }
    return _listImgsMod;
}

@end
