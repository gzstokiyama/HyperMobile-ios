//
//  IndexJViewController.m
//  ttttt
//
//  Created by Albert Chu on 13-9-10.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "IndexJViewController.h"

#import "NewPageJViewController.h"

@interface IndexJViewController ()

@end


@implementation IndexJViewController

#pragma mark - Action Methods

- (void)leftBarButtonItemPressed:(UIBarButtonItem *)barButtonItem
{
    
}

- (void)testButtonPressed:(UIButton *)button
{
    NewPageJViewController *theNPVC = [[NewPageJViewController alloc] init];
    
    [self.navigationController pushViewController:theNPVC animated:YES];
}


#pragma mark - LifeCycle

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
    
    self.title = @"Index";
    
    //-- 背景色 ------------------------------------------------------------------------------------
    self.view.backgroundColor = RGBCOLOR(232, 242, 250);
    //---------------------------------------------------------------------------------------------;
    
    
    //** navBar ************************************************************************************
    
    //-- leftItem ----------------------------------------------------------------------------------
    UIBarButtonItem *leftButtonItem =
    [[UIBarButtonItem alloc]initWithTitle:@"left"
                                    style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(leftBarButtonItemPressed:)];
    
    //leftButtonItem.tintColor = [UIColor greenColor];
    
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    //--------------------------------------------------------------------------------------------//
    
    //********************************************************************************************//
    
    
    
    //** subview ***********************************************************************************
    
    //-- UILabel -----------------------------------------------------------------------------------
    self.testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.f,
                                                               74.f,
                                                               160.f,
                                                               40.f)];
    self.testLabel.font = [UIFont boldSystemFontOfSize:18.0];
    self.testLabel.backgroundColor = [UIColor clearColor];
    self.testLabel.textColor = RGBCOLOR(80, 80, 80);
    self.testLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.testLabel];
    
    self.testLabel.text = @"测试 UILabel";
    //--------------------------------------------------------------------------------------------//
    
    
    //-- UIImageView -------------------------------------------------------------------------------
    self.testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30.f,
                                                                       144.f,
                                                                       150,
                                                                       150)];
    self.testImageView.image = PNGIMAGE(@"test_image");
    [self.testImageView setContentMode:UIViewContentModeScaleAspectFill];
    self.testImageView.clipsToBounds = YES;
    
    ViewRadius(self.testImageView, 5.f);
    
    [self.view addSubview:self.testImageView];
    //--------------------------------------------------------------------------------------------//
    
    
    //-- UIButton ----------------------------------------------------------------------------------
    self.testButton = [[UIButton alloc] initWithFrame:CGRectMake(150.f,
                                                                 324.f,
                                                                 100.f,
                                                                 36.f)];
    [self.testButton setBackgroundImage:PNGIMAGE(@"btn")
                               forState:UIControlStateNormal];
    
    self.testButton.titleLabel.font = [UIFont systemFontOfSize:22.f];
    [self.testButton setTitleColor:RGBCOLOR(255, 255, 255)
                          forState:UIControlStateNormal];
    //[self.testButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    [self.testButton setTitle:@"新页面" forState:UIControlStateNormal];
    
    [self.testButton addTarget:self
                        action:@selector(testButtonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
    
    if (
        nil != [self.communicationDictionary objectForKey:@"someKey"]
        && 0 == [self.communicationDictionary objectForKey:@"someKey"]
        )
    {
        self.testButton.hidden = YES;
    }
    
    [self.view addSubview:self.testButton];
    //--------------------------------------------------------------------------------------------//
    
    
    //********************************************************************************************//
}


@end
