//
//  AppDelegate.m
//  Layout_TabBar_Demo
//
//  Created by Albert Chu on 13-11-26.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstTabJViewController.h"
#import "SecondTabJViewController.h"
#import "ThirdTabJViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    // 初始化标签视图集控制器
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //tabBarController.tabBar.barStyle = UIBarStyleBlack;
    tabBarController.tabBar.barTintColor = RGBCOLOR(240, 200, 80);
    tabBarController.tabBar.tintColor = RGBCOLOR(60, 120, 30);
    
    // 初始化第一个标签视图控制器 (在导航控制器中)
    FirstTabJViewController *firstTabJVC = [[FirstTabJViewController alloc] init];
    UINavigationController *firstTabJVCInNavC = [[UINavigationController alloc] initWithRootViewController:firstTabJVC];
    firstTabJVC.tabBarItem.image = [UIImage imageNamed:@"bubble"];
    firstTabJVC.title = @"First";
    
    // 初始化第二个标签视图控制器 (UIViewController)
    SecondTabJViewController *secondTabJVC = [[SecondTabJViewController alloc] init];
    secondTabJVC.tabBarItem.image = [UIImage imageNamed:@"cloud-download"];
    secondTabJVC.title = @"Second";
    
    // 初始化第三个标签视图控制器 (UIViewController)
    ThirdTabJViewController *thirdTabJVC = [[ThirdTabJViewController alloc] init];
    UINavigationController *thirdTabJVCInNavC = [[UINavigationController alloc] initWithRootViewController:thirdTabJVC];
    thirdTabJVC.tabBarItem.image = [UIImage imageNamed:@"settings1"];
    thirdTabJVC.title = @"设置";
    
    // 将子视图控制器装入 UITabBarController
    tabBarController.viewControllers = @[firstTabJVCInNavC, secondTabJVC, thirdTabJVCInNavC];
    
    self.window.rootViewController = tabBarController;
    
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
