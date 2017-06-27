//
//  ZJJGetSystemPhoto.h
//  CaptureImageDemo
//
//  Created by 张锦江 on 2017/6/27.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZJJBlock)(UIImage *);

@interface ZJJGetSystemPhoto : UIViewController

/**
 ⚠️
 
 这里 sourceType 是决定打开相册还是相机的类型
 
 相册: UIImagePickerControllerSourceTypePhotoLibrary
 
 相机: UIImagePickerControllerSourceTypeCamera
 
 */

@property (nonatomic, assign)  UIImagePickerControllerSourceType sourceType;

@property (nonatomic, copy)    ZJJBlock myImageBlock;

@end
