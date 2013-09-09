//
//  LeftBarBtnViewController.m
//  TestNavBar
//
//  Created by Albert Chu on 13-9-3.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "LeftBarBtnJViewController.h"

enum EM_ActionSheetTag
{
    ACT_no_pic                   = 11127,
    ACT_choosed_pic              = 11128
};

@interface LeftBarBtnJViewController ()
{
    /** 选择的图片 */
    UIImage *_choosedImg;
}

@end


@implementation LeftBarBtnJViewController


#pragma mark - ImageView TapGestureRecognizer Action

- (void)onTapOfImageView:(UITapGestureRecognizer *)tapGes
{    
    RIButtonItem *cancel = [RIButtonItem item];
    cancel.label = @"取消";
    cancel.action = ^{
        NSLog(@"cancel Button pressed!");
    };
    
    RIButtonItem *item1 = [RIButtonItem item];
    item1.label = @"拍照";
    item1.action = ^{
        NSLog(@"拍照");
        
        //资源类型为照相机
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        
        //判断是否有相机
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            
            //设置拍照后的图片可被编辑
            //picker.allowsEditing = YES;
            
            //资源类型为照相机
            picker.sourceType = sourceType;
            [self presentViewController:picker animated:YES completion:nil];
        }
        
        else
        {
            DLog(@"该设备无摄像头");
            [[MBProgressHUDManager sharedInstance] showHUDViewOnView:self.view
                                                        withOnlyText:@"无摄像头"
                                                           hideAfter:2];
        }
        
    };
    
    RIButtonItem *item2 = [RIButtonItem itemWithLabel:@"相册"];
    item2.action = ^{
        NSLog(@"相册");
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        //资源类型为图片库
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        
        //设置选择后的图片可被编辑
        //picker.allowsEditing = YES;
        
        [self presentViewController:picker animated:YES completion:nil];
        
    };
    
    RIButtonItem *destructiveItem = [RIButtonItem itemWithLabel:@"删除"];
    destructiveItem.action = ^{
        
        NSLog(@"删除!!!");
        
        self.choosedImage = nil;
        self.imageView.image = PNGIMAGE(@"default_image");
                
    };
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Title"
                                                     cancelButtonItem:cancel
                                                destructiveButtonItem:destructiveItem
                                                     otherButtonItems:item1,item2, nil];
    [actionSheet showInView:self.view];
}



#pragma mark - UIImagePickerController Delegate

/** 已选择图片 */
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    DLog(@"INFO : %@", info);
    
    UIImage *pickedImg = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    DLog(@"w:%f-----h:%f",pickedImg.size.width, pickedImg.size.height);
    
    // 限制照片分辨率
    if ( pickedImg.size.width > 800 || pickedImg.size.height > 800 )
    {
        self.choosedImage = [pickedImg scaledToSizeByRangeMaxWidth:800 andMaxHeight:800];
    }
    else
    {
        self.choosedImage = pickedImg;
    }
    
    self.imageView.image = self.choosedImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

/** 取消选择图片 */
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    DLog(@"取消图片选择");
}

/** 保存完成的回调代理方法 */
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    if (!error)
    {
        DLog(@"Image written to photo album");
    }
    
    else
    {
        DLog(@"Error writing to photo album: %@", [error localizedDescription]);
    }
}




#pragma mark - NavigationBarButtonItem Actions

- (void)leftBarButtonItemPressed:(UIBarButtonItem *)barButtonItem
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)rightBarButtonItemPressed:(UIBarButtonItem *)barButtonItem
{
    DLog(@"%@", barButtonItem.title);
}


#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"LBBPresentVC";
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    //** navBar ************************************************************************************
    self.navigationController.navigationBar.tintColor =
    [UIColor colorWithRed:52 / 255.f green:112 / 255.f blue:162 / 255.f alpha:1.f];
    
    //-- leftItem ----------------------------------------------------------------------------------
    UIBarButtonItem *leftButtonItem =
    [[UIBarButtonItem alloc]initWithTitle:@"返回"
                                    style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(leftBarButtonItemPressed:)];
    
    leftButtonItem.tintColor =
    [UIColor colorWithRed:62 / 255.f green:132 / 255.f blue:182 / 255.f alpha:1.f];
    
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    //--------------------------------------------------------------------------------------------//
    
    
    //-- rightItem ---------------------------------------------------------------------------------
	UIBarButtonItem *rightButtonItem =
    [[UIBarButtonItem alloc]initWithTitle:@"发送"
                                    style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(rightBarButtonItemPressed:)];
    
    rightButtonItem.tintColor =
    [UIColor colorWithRed:62 / 255.f green:132 / 255.f blue:182 / 255.f alpha:1.f];
    
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    //--------------------------------------------------------------------------------------------//
    
    
    //********************************************************************************************//
    
    
    //-- UIImageView -------------------------------------------------------------------------------
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100.f,
                                                                   100.f,
                                                                   150,
                                                                   150)];
    self.imageView.image = PNGIMAGE(@"default_image");
    [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
    self.imageView.clipsToBounds = YES;
    
    [self.imageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapGes =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(onTapOfImageView:)];
    [self.imageView addGestureRecognizer:tapGes];
    
    ViewRadius(self.imageView, 5.f);
    
    [self.view addSubview:self.imageView];
    //--------------------------------------------------------------------------------------------//
    
}


#pragma mark - MemoryWaring

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
