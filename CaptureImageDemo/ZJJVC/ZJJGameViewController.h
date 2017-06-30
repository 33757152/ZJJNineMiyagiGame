//
//  ZJJGameViewController.h
//  CaptureImageDemo
//
//  Created by 张锦江 on 2017/6/26.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJJGameViewController : UIViewController

@property (nonatomic,strong) UIImage *originImage; // 原始图片
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,assign) float imageW;
@property (nonatomic,assign) float imageH;
@property (nonatomic,assign) CGRect totalFrame;  // 原始图片的frame

@end
