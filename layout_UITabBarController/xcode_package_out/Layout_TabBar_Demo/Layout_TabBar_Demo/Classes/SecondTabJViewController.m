//
//  SecondTabViewController.m
//  Layout_TabBar_Demo
//
//  Created by Albert Chu on 13-11-26.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "SecondTabJViewController.h"

@interface SecondTabJViewController ()

@end

@implementation SecondTabJViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //-- 测试透明度 ----------------------------------------------------------------------------------
    UITextView *testTextView = [[UITextView alloc] initWithFrame:CGRectMake(0.f,
                                                                            300.f,
                                                                            320.f,
                                                                            200.f)];
    
    
    testTextView.text = @"测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度测试透明度";
    
    [testTextView setTextColor:[UIColor blackColor]];
    
    testTextView.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO ; // 禁用自动延伸到导航栏及状态栏
    
    [self.view addSubview:testTextView];
    //--------------------------------------------------------------------------------------------//
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
