//
//  CustomView.m
//  CaptureImageDemo
//
//  Created by 张锦江 on 2017/6/26.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

+ (UIImage *)captureImageWithView:(UIImageView *)currentView andClipRect:(CGRect)cropRect {
    CGRect cropFrame = currentView.frame;
    CGImageRef imgRef = CGImageCreateWithImageInRect(currentView.image.CGImage, cropRect);
    CGFloat deviceScale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(cropFrame.size, 0, deviceScale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, cropFrame.size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextDrawImage(context, CGRectMake(0, 0, cropFrame.size.width, cropFrame.size.height), imgRef);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    CGImageRelease(imgRef);
    UIGraphicsEndImageContext();
    
    return newImage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
