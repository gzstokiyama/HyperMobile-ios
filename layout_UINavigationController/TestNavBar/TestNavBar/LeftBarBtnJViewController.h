//
//  LeftBarBtnViewController.h
//  TestNavBar
//
//  Created by Albert Chu on 13-9-3.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftBarBtnJViewController : UIViewController
<
UIActionSheetDelegate
,UINavigationControllerDelegate
,UIImagePickerControllerDelegate
>

@property (strong, nonatomic) UIImageView   *imageView;

@property (strong, nonatomic) UIImage       *choosedImage;

@end
