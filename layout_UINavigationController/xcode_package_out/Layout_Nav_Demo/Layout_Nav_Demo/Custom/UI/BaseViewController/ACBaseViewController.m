//
//  ACBaseViewController.m
//

#import "ACBaseViewController.h"


@interface ACBaseViewController ()
{
    
}

@end


@implementation ACBaseViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    //** 状态栏文字黑白？导航栏底色、导航栏标题文字颜色、导航栏互动按钮文字颜色，恢复为四个属性指定的颜色 **********
    //
    
    // 状态栏
    if (self.lightStatusBarColor)
    {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    else
    {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
    
    // 恢复导航栏底色
    self.navigationController.navigationBar.barTintColor = self.navigationBarBarTintColor;
    
    // 恢复导航栏互动按钮文字颜色
    self.navigationController.navigationBar.tintColor = self.navigationBarActionItemTintColor;
    
    // 如果没有指定颜色，则从 self.navigationBarTitleTextTintColor 自身容器中恢复颜色
    if (!self.navigationBarTitleTextTintColor)
    {
        self.navigationController.navigationBar.titleTextAttributes = self.navigationBarTitleTextAttributes;
    }
    else
    {
        [self.navigationController.navigationBar doSetTitleTextColorBy:self.navigationBarTitleTextTintColor];
    }
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    
}


#pragma mark - Life Cycle

- (id)init
{
    self = [super init];
    if (self)
    {
        // 如果用户没有指定该 视图控制器 的导航栏底色，则从前一个中取，即继承之前的颜色
        if (!self.navigationBarBarTintColor)
        {
            self.navigationBarBarTintColor = self.navigationController.navigationBar.barTintColor;
        }
        
        // 如果用户没有指定该 视图控制器 的导航栏互动按钮文字颜色，则从前一个中取，即继承之前的颜色
        if (!self.navigationBarActionItemTintColor)
        {
            self.navigationBarActionItemTintColor = self.navigationController.navigationBar.tintColor;
        }
        
        // 如果没有指定该 视图控制器 的 导航栏标题颜色，则从前一个取
        if (!self.navigationBarTitleTextTintColor)
        {
           self.navigationBarTitleTextAttributes = self.navigationController.navigationBar.titleTextAttributes;
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    //-- 导航栏 ------------------------------------------------------------------------------------
    //self.navigationController.navigationBar.tintColor = C_NavBarTintColor;
    //[[UIBarButtonItem appearance] setTintColor:C_BarButtonItemTintColor];
    
    
    //---------------------------------------------------------------------------------------------;
    
    
    //-- 背景 --------------------------------------------------------------------------------------
    self.view.backgroundColor = C_BG_Color;
    
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:PNGIMAGE(@"bg")]];
    //---------------------------------------------------------------------------------------------;
}


#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


@end
