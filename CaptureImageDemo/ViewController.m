//
//  ViewController.m
//  CaptureImageDemo
//
//  Created by 张锦江 on 2017/6/26.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#define IMAGE_NAME  @"1.jpg"

#import "ViewController.h"
#import "CustomView.h"
#import "ZJJGameViewController.h"
#import "ZJJGetSystemPhoto.h"
#import "ZJJHeader.h"
#import "FPJWarnLabelView.h"

typedef NS_ENUM(NSUInteger, ZJJPhotoType) {
    ZJJPhotoTypePhoto,   // 相册
    ZJJPhotoTypeCamera   // 相机
};

@interface ViewController () {
    UIImageView *_zjjImageView;
    NSMutableArray *_dataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatUI];
}

#pragma mark - 方法
- (void)creatUI {
    _zjjImageView = [[UIImageView alloc] init];
    _zjjImageView.frame = CGRectMake((kScreenWidth-326)/2, 70, 326, 300);
    [self.view addSubview:_zjjImageView];
    
    for (int i = 0; i<2; i++) {
        UIButton *next = [UIButton buttonWithType:UIButtonTypeSystem];
        next.frame = CGRectMake(50+(100+kScreenWidth-300)*(i%2), _zjjImageView.frame.origin.y+_zjjImageView.frame.size.height+40, 100, 50);
        [next setTitle:i == 0 ? @"选择图片" : @"开始拼图" forState:UIControlStateNormal];
        UIColor *color = i == 0 ? [UIColor blackColor] : [UIColor redColor];
        next.backgroundColor = color;
        [next setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [next addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:next];
    }
}
#pragma mark - 方法
- (void)captureImages {
   _dataArray = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i<9; i++) {
        UIImage *image = [CustomView captureImageWithView:_zjjImageView andClipRect:CGRectMake((326/3)*(i%3), 100*(i/3), 326/3, 100)];
        [_dataArray addObject:image];
    }
}
#pragma mark - 方法
- (void)nextClick:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"选择图片"]) {
        ZJJGetSystemPhoto *photo = [[ZJJGetSystemPhoto alloc] init];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择图片" message:@"亲,开始选择吧?" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            photo.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            photo.myImageBlock = ^(UIImage *image) {
                UIImage *newImage = [self imageWithImageSimple:image scaledToSize:CGSizeMake(300, 300)];
                _zjjImageView.image = newImage;
            };
            [self.navigationController pushViewController:photo animated:NO];
        }];
        
        UIAlertAction *caremaAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            photo.sourceType = UIImagePickerControllerSourceTypeCamera;
            photo.myImageBlock = ^(UIImage *image) {
                UIImage *newImage = [self imageWithImageSimple:image scaledToSize:CGSizeMake(300, 300)];
                _zjjImageView.image = newImage;
            };
            [self.navigationController pushViewController:photo animated:NO];
        }];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"默认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIImage *newImage = [self imageWithImageSimple:[UIImage imageNamed:IMAGE_NAME] scaledToSize:CGSizeMake(300, 300)];
            _zjjImageView.image = newImage;

        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:photoAction];
        [alert addAction:caremaAction];
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }else {
        UIImage *image = _zjjImageView.image;
        if (image == nil) {
            [FPJWarnLabelView warnLabelWithTitle:@"请选择图片!"];
            return;
        }
        [self captureImages];
        ZJJGameViewController *vc = [[ZJJGameViewController alloc] init];
        vc.originImage = _zjjImageView.image;
        vc.dataArray = _dataArray;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UIImage *)imageWithImageSimple:( UIImage *)image scaledToSize:( CGSize )newSize

{
    
    // Create a graphics image context
    
    UIGraphicsBeginImageContext (newSize);
    
    // Tell the old image to draw in this new context, with the desired
    
    // new size
    
    [image drawInRect : CGRectMake ( 0 , 0 ,newSize. width ,newSize. height )];
    
    // Get the new image from the context
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext ();
    
    // End the context
    
    UIGraphicsEndImageContext ();
    
    // Return the new image.
    
    return newImage;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
