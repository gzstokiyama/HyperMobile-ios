//
//  IndexJViewController.m
//  ttttt
//
//  Created by Albert Chu on 13-9-10.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "IndexJViewController.h"

@interface IndexJViewController ()

@end


@implementation IndexJViewController

#pragma mark - Action Methods

- (void)leftBarButtonItemPressed:(UIBarButtonItem *)barButtonItem
{
    
}

- (void)testButtonPressed:(UIButton *)button
{
    DLog(@"test Button Pressed");
}


#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = RGBCOLOR(232, 242, 250);
    
    //** navBar ************************************************************************************
    self.title = @"Index";
        
    self.navigationController.navigationBar.tintColor = RGBCOLOR(52, 112, 162);
    
    //-- leftItem ----------------------------------------------------------------------------------
    UIBarButtonItem *leftButtonItem =
    [[UIBarButtonItem alloc]initWithTitle:@"left"
                                    style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(leftBarButtonItemPressed:)];
    
    leftButtonItem.tintColor = RGBCOLOR(62, 132, 182);
    
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    //--------------------------------------------------------------------------------------------//
    
    //********************************************************************************************//
    
    
    
    //** subview ***********************************************************************************
    
    //-- UILabel -----------------------------------------------------------------------------------
    self.testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.f,
                                                               10.f,
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
                                                                       70.f,
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
                                                                 260.f,
                                                                 100.f,
                                                                 36.f)];
    [self.testButton setBackgroundImage:PNGIMAGE(@"btn")
                               forState:UIControlStateNormal];
    
    self.testButton.titleLabel.font = [UIFont systemFontOfSize:22.f];
    [self.testButton setTitleColor:RGBCOLOR(255, 255, 255)
                          forState:UIControlStateNormal];
    //[self.testButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    [self.testButton setTitle:@"按钮" forState:UIControlStateNormal];
    
    [self.testButton addTarget:self
                        action:@selector(testButtonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.testButton];
    //--------------------------------------------------------------------------------------------//
    
    
    //********************************************************************************************//
}



@end
