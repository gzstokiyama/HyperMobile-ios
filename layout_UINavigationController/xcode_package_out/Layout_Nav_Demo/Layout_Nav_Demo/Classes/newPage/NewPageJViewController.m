//
//  NewPageJViewController.m
//  Layout_Nav_Demo
//
//  Created by Albert Chu on 13-9-17.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "NewPageJViewController.h"

@interface NewPageJViewController ()

@end


@implementation NewPageJViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        //-- 状态栏文字颜色 --------------------------------------------------------------------------
        //self.lightStatusBarColor = NO;
        //-----------------------------------------------------------------------------------------;
        
        
        //-- 导航栏各种着色 --------------------------------------------------------------------------
        
        // 导航栏背景色
        self.navigationBarBarTintColor = RGBCOLOR(52, 122, 162);
        
        // 互动按钮 文字 颜色
        self.navigationBarActionItemTintColor = RGBCOLOR(0, 0, 0);
        
        // 导航栏 Title 文字 颜色
        self.navigationBarTitleTextTintColor = RGBCOLOR(0, 0, 0);
        //-----------------------------------------------------------------------------------------;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"New Page";
    
    
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
