//
//  UIImage+ReSizeMethods.h
//
//  Created by Albert Chu on 13-7-17.
//

#import "UIImage+ReSizeMethods.h"

@implementation UIImage (ReSizeMethods)


/**
 * 缩放图片并保持比例，且图片宽高不超过指定范围
 * @return UIImage
 * @param width 最大宽度（像素）
 * @param height 最大高度（像素）
 */
- (UIImage *)scaledToSizeByRangeMaxWidth:(CGFloat)width
                            andMaxHeight:(CGFloat)height
{
    // 图片原始宽高
    CGFloat original_w = self.size.width;
    CGFloat original_h = self.size.height;
    
    if (original_w > original_h)
    {
        return [self scaleImage:self toScale:(width / original_w)];
    }
    else
    {
        return [self scaleImage:self toScale:(height / original_h)];
    }
}

/** 等比例缩放 */
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

@end
