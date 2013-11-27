//
//  MBProgressHUDManager.h
//  MBProgressHUDManager
//
//  Created by Albert Chu on 13-6-16.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBProgressHUDManager : NSObject

+ (MBProgressHUDManager *)sharedInstance;

/**
 * 在某UIView上显示文字及转圈的加载提示
 * @param theView 显示在哪个UIView上
 * @param theText 提示文字
 */
- (void)showLoadingHUDViewOnView:(UIView *)theView withText:(NSString *)theText;

/**
 * 隐藏Loading动画
 */
- (void)hideLoadingView;

/**
 * 在某UIView上显示纯文字提示
 * @param theView 显示在哪个UIView上
 * @param theText 提示文字
 * @param theDelayTime 显示多久后隐藏
 */
- (void)showHUDViewOnView:(UIView *)theView
             withOnlyText:(NSString *)theText
                hideAfter:(NSTimeInterval)theDelayTime;

/**
 * 在某UIView上显示图片及文字提示
 * @param theView 显示在哪个UIView上
 * @param theText 提示文字
 * @param theImage 图片
 * @param theDelayTime 显示多久后隐藏
 */
- (void)showHUDViewOnView:(UIView *)theView
                 withText:(NSString *)theText
                 andImage:(UIImage *)theImage
                hideAfter:(NSTimeInterval)theDelayTime;

@end
