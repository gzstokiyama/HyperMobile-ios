//
//  ACBaseViewController.m
//

#import "ACBaseViewController.h"


@interface ACBaseViewController ()
{
    
}

@end


@implementation ACBaseViewController

#pragma mark - Action Methods

- (void)backBtnPressed:(id)sender
{
    if (BVLT_ModalType == self.loadType)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (BVLT_PushType == self.loadType)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"error 未设置 视图控制器 加载方式");
    }
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //-- 导航栏 ------------------------------------------------------------------------------------
    self.navigationController.navigationBar.tintColor = C_NavBarTintColor;
    [[UIBarButtonItem appearance] setTintColor:C_BarButtonItemTintColor];
    
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
