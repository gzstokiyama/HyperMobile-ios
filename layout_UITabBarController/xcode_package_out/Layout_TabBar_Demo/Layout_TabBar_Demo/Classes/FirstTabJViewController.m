//
//  FirstTabJViewController.m
//  Layout_TabBar_Demo
//
//  Created by Albert Chu on 13-11-26.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "FirstTabJViewController.h"

@interface FirstTabJViewController ()

@end

@implementation FirstTabJViewController


- (id)init
{
    self = [super init];
    if (self)
    {        
        //-- 状态栏文字颜色 --------------------------------------------------------------------------
        self.lightStatusBarColor = YES;
        //-----------------------------------------------------------------------------------------;
        
        
        //-- 导航栏各种着色 --------------------------------------------------------------------------
        
        // 导航栏背景色
        self.navigationBarBarTintColor = C_custom_barTintColor;
        
        // 互动按钮 文字 颜色
        self.navigationBarActionItemTintColor = C_custom_barActionItemColor;
        
        // 导航栏 Title 文字 颜色
        self.navigationBarTitleTextTintColor = C_custom_barTitleColor;
        //-----------------------------------------------------------------------------------------;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
