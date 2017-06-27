//
//  CustomView.h
//  CaptureImageDemo
//
//  Created by 张锦江 on 2017/6/26.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

/**
 * 这里 currentView 为初始的 需要截取的 原图 ，注意是 UIImageView 类型的
 * cropRect 就是你需要在 该原图上面截取的范围
*/
+ (UIImage *)captureImageWithView:(UIImageView *)currentView andClipRect:(CGRect)cropRect;

@end
