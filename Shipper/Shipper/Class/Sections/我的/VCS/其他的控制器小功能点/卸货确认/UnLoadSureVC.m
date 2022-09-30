//
//  UnLoadSureVC.m
//  NtoccShipper
//
//  Created by mac on 2019/12/2.
//  Copyright © 2019 zhuchongjin. All rights reserved.
//

#import "UnLoadSureVC.h"

@interface UnLoadSureVC ()<UITableViewDelegate,UITableViewDataSource>{
    UIView* _imgParent;
    FlexFrameView *header;
    int index;  // 记录图片的位置
    
    UIView* _imgAbnormalParent;
    int indexAbnormal;  // 记录图片的位置



}
@property (nonatomic,strong) CJTableView *tableView;

@property (nonatomic,strong) UISwitch *switchInRecive; // 是否货单已收 abnormal
@property (nonatomic,strong) UISwitch *switchabnormal; // 是否货单已收 abnormal

@end

@implementation UnLoadSureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitleName:CJLString(@"卸货确认")];
    [self setBackLeftButton:@""];
    [self.view addSubview:self.tableView];
    [self createTableView];

}


//上传回单图片
-(void)onAddImage
{
    DLog(@"++++++++++%d",index);
    

    
    [GetPhoto getPhoto:self completion:^(UIImage *curImage, NSData *imageData) {

//        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeCell:)];

        index++;

        UIView* cell = [[UIView alloc]init];

        cell.tag = index;

        [cell enableFlexLayout:YES];
//        [cell addGestureRecognizer:tap];

        [cell setLayoutAttrStrings:@[
                                     @"width",@"65",
                                     @"height",@"65",
                                     @"margin",@"1.5%",
                                     @"alignItems",@"center",
                                     @"justifyContent",@"center",
                                     ]];
        [cell setViewAttr:@"bgColor" Value:@"#e5e5e5"];
        [cell setViewAttr:@"borderRadius" Value:@"10"];
        [_imgParent insertSubview:cell atIndex:0];
//        _imgParent.backgroundColor = [UIColor cjRedColor];

        [_imgParent markDirty];
        [header layoutIfNeeded];
//        self.tableView.tableHeaderView = header;

        cell.layer.contents = (id) curImage.CGImage;
//        self.isChangeImg = NO;
//        [self upLoadImageUImage:curImage withNSData:imageData];
        [self.tableView reloadData];
    }];
    
}

//上传异常图片
-(void)onAddAbnormalImage
{
    DLog(@"++++++++++%d",index);
    
    [GetPhoto getPhoto:self completion:^(UIImage *curImage, NSData *imageData) {
        
//        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeCell:)];
        
        indexAbnormal++;
        
        UIView* cell = [[UIView alloc]init];
        
        cell.tag = index;
        
        [cell enableFlexLayout:YES];
//        [cell addGestureRecognizer:tap];
        
        [cell setLayoutAttrStrings:@[
                                     @"width",@"65",
                                     @"height",@"65",
                                     @"margin",@"1.5%",
                                     @"alignItems",@"center",
                                     @"justifyContent",@"center",
                                     ]];
        [cell setViewAttr:@"bgColor" Value:@"#e5e5e5"];
        [cell setViewAttr:@"borderRadius" Value:@"10"];
        [_imgParent insertSubview:cell atIndex:0];
//        _imgParent.backgroundColor = [UIColor cjRedColor];
        
        [_imgParent markDirty];
        [header layoutIfNeeded];
//        self.tableView.tableHeaderView = header;
        
        cell.layer.contents = (id) curImage.CGImage;
//        self.isChangeImg = NO;
//        [self upLoadImageUImage:curImage withNSData:imageData];
        [self.tableView reloadData];
    }];
    
}

- (void)btnSaveInfoAction{
    [CJAlert showStringDismissWithDelay:@"隐私协议"];
}

/// 创建tableview 等
- (void)createTableView{
    
    //    WS(ws);
    CGRect rcFrame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 0);
    header = [[FlexFrameView alloc] initWithFlex:@"UnLoadSureHeaderView" Frame:rcFrame Owner:self];
    header.flexibleHeight = YES;
    
    
    [header layoutIfNeeded];
    
    [self.switchInRecive addTarget:self action:@selector(switchInSureAction:)forControlEvents:UIControlEventValueChanged | UIControlEventTouchDragExit];
    self.switchInRecive.transform = CGAffineTransformMakeScale(0.75, 0.75);
    self.switchInRecive.onTintColor = [UIColor cjMainColor];
    
    
    [self.switchabnormal addTarget:self action:@selector(switchAbnormalAction:)forControlEvents:UIControlEventValueChanged | UIControlEventTouchDragExit];
    self.switchabnormal.transform = CGAffineTransformMakeScale(0.75, 0.75);
    self.switchabnormal.onTintColor = [UIColor cjMainColor];
    
    self.tableView.tableHeaderView = header;
    [self.tableView reloadData];

}

-(void)switchInSureAction:(UISwitch *)sender
{

    if([sender isOn]){
        NSLog(@"turn on");
    }else{
        NSLog(@"turned off");
    }

}
-(void)switchAbnormalAction:(UISwitch *)sender
{

    if([sender isOn]){
        NSLog(@"turn on");
    }else{
        NSLog(@"turned off");
    }

}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MeViewCellId = @"DriverAouthVCcellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MeViewCellId];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MeViewCellId];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    
//    cell.imageView.image = [UIImage imageNamed:self.arrImgs[indexPath.row]];
//    CGSize itemSize = CGSizeMake(25, 25);
//    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
//    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
//    [cell.imageView.image drawInRect:imageRect];
//    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    cell.textLabel.text = self.arrTitles[indexPath.row];
//    cell.separatorInset = UIEdgeInsetsMake(0.3f, 50.0f, 0.0f,0.0f);
    return cell;

}



- (CJTableView *)tableView{
    if (!_tableView) {
        _tableView = CJTableView.tbInitFrameStyle(CGRectMake(0, kTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kTopHeight),UITableViewStylePlain)
        .tbDelegate(self)
        .tbDataSource(self)
        .tbSetOther(YES)
        .tbEstimatedRowHeight(YES)
//        .tbMjHeadFooter(YES)
        ;
//        WS(ws);
//        _tableView.blockMjHeader = ^(BOOL isheader) {
//
//            if (isheader) {
//                [ws downRefresh];
//            } else {
//                [ws upRefresh];
//            }
//
//        };

    }
    
    return _tableView;
}

@end


