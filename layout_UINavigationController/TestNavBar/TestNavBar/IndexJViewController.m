//
//  ViewController.m
//  TestNavBar
//
//  Created by Albert Chu on 13-8-30.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//


#import "IndexJViewController.h"

#import "UIPlaceHolderTextField.h"
#import "UIPlaceHolderTextView.h"

#import "LeftBarBtnJViewController.h"
#import "RightBarBtnJViewController.h"


@interface IndexJViewController ()

@end


@implementation IndexJViewController

#pragma mark - Action Methods

- (void)leftBarButtonItemPressed:(UIBarButtonItem *)barButtonItem
{
    DLog(@"%@", barButtonItem.title);
    // Creat VC
    LeftBarBtnJViewController *lVC = [[LeftBarBtnJViewController alloc] init];
        
    // Modal
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:lVC];
    nc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;

    [self presentViewController:nc animated:YES completion:nil];
}

- (void)rightBarButtonItemPressed:(UIBarButtonItem *)barButtonItem
{
    // Creat VC
    RightBarBtnJViewController *rVC = [[RightBarBtnJViewController alloc] init];
    
    // Push
    [self.navigationController pushViewController:rVC animated:YES];
}

- (void)testButtonPressed:(UIButton *)button
{
    DLog(@"test Button Pressed");
}

- (void)onTapOfTestImageView:(UITapGestureRecognizer *)tapGes
{
    DLog(@"UIImageView 点击事件");
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Index";
    
    self.view.backgroundColor = RGBCOLOR(232, 242, 250);
    
    //** navBar ************************************************************************************
    self.navigationController.navigationBar.tintColor =  RGBCOLOR(52, 112, 162);
    
    //-- leftItem ----------------------------------------------------------------------------------
    UIBarButtonItem *leftButtonItem =
    [[UIBarButtonItem alloc]initWithTitle:@"left"
                                    style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(leftBarButtonItemPressed:)];
    
    leftButtonItem.tintColor =  RGBCOLOR(62, 132, 182);
    
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    //--------------------------------------------------------------------------------------------//
    
    
    //-- rightItem ---------------------------------------------------------------------------------
	UIBarButtonItem *rightButtonItem =
    [[UIBarButtonItem alloc]initWithTitle:@"right"
                                    style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(rightBarButtonItemPressed:)];
    
    rightButtonItem.tintColor =  RGBCOLOR(62, 132, 182);
    
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    //--------------------------------------------------------------------------------------------//
    
    
    //********************************************************************************************//
    
    
    //** subview ***********************************************************************************
    
    //-- UIPlaceHolderTextField --------------------------------------------------------------------
    self.testTextField = [[UIPlaceHolderTextField alloc] initWithFrame:CGRectMake(10.f,
                                                                                  10.f,
                                                                                  300.f,
                                                                                  40.f)];
    [self.testTextField setBorderStyle:UITextBorderStyleNone];
    [self.testTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.testTextField setReturnKeyType:UIReturnKeyDone];
    [self.testTextField setDelegate:self];
    
    self.testTextField.font = [UIFont systemFontOfSize:16.0];
    self.testTextField.textColor = [UIColor blueColor];
    
    self.testTextField.backgroundColor = [UIColor whiteColor];
    
    [self.testTextField setPlaceholder:@"请输入标题..."];
    //self.testTextField.textLeftMargin = 8.f;  // 默认距离左边 8.f
    
    ViewBorderRadius(self.testTextField, 5.f, 1.f, [UIColor lightGrayColor]);
    
    [self.view addSubview:self.testTextField];
    //--------------------------------------------------------------------------------------------//
    
    
    //-- UIPlaceHolderTextView ---------------------------------------------------------------------
    self.testTextView = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(10.f,
                                                                                60.f,
                                                                                300.f,
                                                                                150.f)];
    
    self.testTextView.placeholder = @"请输入内容...";
    
    self.testTextView.backgroundColor = [UIColor whiteColor];
    self.testTextView.font = [UIFont systemFontOfSize:16.f];
    
    ViewBorderRadius(self.testTextView, 5.f, 1.f, [UIColor lightGrayColor]);
    
    [self.view addSubview:self.testTextView];
    //--------------------------------------------------------------------------------------------//
    
    
    //-- UILabel -----------------------------------------------------------------------------------
    self.testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.f,
                                                               220.f,
                                                               160.f,
                                                               50.f)];
    self.testLabel.font = [UIFont boldSystemFontOfSize:18.0];
    self.testLabel.backgroundColor = [UIColor yellowColor];
    self.testLabel.textColor = [UIColor blackColor];
    self.testLabel.textAlignment = TextAlignmentCenter;
    [self.view addSubview:self.testLabel];
    
    self.testLabel.text = @"label";
    //--------------------------------------------------------------------------------------------//
    
    
    //-- UIButton ----------------------------------------------------------------------------------
    self.testButton = [[UIButton alloc] initWithFrame:CGRectMake(200.f,
                                                                 220.f,
                                                                 100.f,
                                                                 40.f)];
    [self.testButton setBackgroundImage:PNGIMAGE(@"btn")
                               forState:UIControlStateNormal];
    
    self.testButton.titleLabel.font = [UIFont systemFontOfSize:22.f];
    [self.testButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[self.testButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    [self.testButton setTitle:@"button" forState:UIControlStateNormal];
    
    [self.testButton addTarget:self
                        action:@selector(testButtonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.testButton];
    //--------------------------------------------------------------------------------------------//
    
    
    //-- UIImageView -------------------------------------------------------------------------------
    self.testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(200.f,
                                                                       280.f,
                                                                       90,
                                                                       90)];
    self.testImageView.image = PNGIMAGE(@"default_image");
    [self.testImageView setContentMode:UIViewContentModeScaleAspectFill];
    self.testImageView.clipsToBounds = YES;
    
    [self.testImageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapGes =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(onTapOfTestImageView:)];
    [self.testImageView addGestureRecognizer:tapGes];
    
    ViewRadius(self.testImageView, 5.f);
    
    [self.view addSubview:self.testImageView];
    //--------------------------------------------------------------------------------------------//
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Touch Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.testTextField resignFirstResponder];
    [self.testTextView resignFirstResponder];
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
