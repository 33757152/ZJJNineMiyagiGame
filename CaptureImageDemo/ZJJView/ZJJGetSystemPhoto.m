//
//  ZJJGetSystemPhoto.m
//  CaptureImageDemo
//
//  Created by 张锦江 on 2017/6/27.
//  Copyright © 2017年 ZJJ. All rights reserved.
//
#define   ZJJLOG    NSLog(@"%s",__func__);

#import "ZJJGetSystemPhoto.h"

@interface ZJJGetSystemPhoto () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation ZJJGetSystemPhoto

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
}

- (void)creatUI {
    UIImagePickerController *pic = [[UIImagePickerController alloc] init];
    pic.delegate = self;
    pic.sourceType = _sourceType;
    [self presentViewController:pic animated:NO completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    ZJJLOG
    //NSLog(@"info=%@",info);
    UIImage *select = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:NO completion:nil];
    if (_myImageBlock) {
        _myImageBlock(select);
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    ZJJLOG
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
