//
//  UIImage+ConvertRGBToGreyScale.h
//
//  Created by Albert Chu on 13-7-12.
//

#import <UIKit/UIKit.h>

@interface UIImage (ConvertRGBToGreyScale)

/**
 * 将彩色图转换为黑白图 (缺点：png格式透明部分会被转黑)
 * @return UIImage
 * @param 无
 */
- (UIImage *)convertRGBImageToGreyScale;

/**
 * 将彩色图转换为黑白图
 * @return UIImage
 * @param type 样式 (1-灰度; 2- ; 3-反转色)
 */
- (UIImage *)convertRGBImageToGreyScaleByType:(char)type;

@end
