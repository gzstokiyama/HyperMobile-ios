//
//  UIImage+ReSizeMethods.h
//
//  Created by Albert Chu on 13-7-17.
//

#import <UIKit/UIKit.h>

@interface UIImage (ReSizeMethods)


/**
 * 缩放图片并保持比例，且图片宽高不超过指定范围
 * @return UIImage
 * @param width 最大宽度（像素）
 * @param height 最大高度（像素）
 */
- (UIImage *)scaledToSizeByRangeMaxWidth:(CGFloat)width
                            andMaxHeight:(CGFloat)height;


@end
