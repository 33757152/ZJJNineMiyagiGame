//
//  FPJWarnLabelView.m
//  ZJJPractiseFMDBDemo
//
//  Created by 丰普 on 16/12/22.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "FPJWarnLabelView.h"
#import "ZJJHeader.h"

@interface FPJWarnLabelView () {
    UILabel *_warnLabel;
}

@end

@implementation FPJWarnLabelView

+ (void)warnLabelWithTitle:(NSString *)title {
    
    [[self alloc] comeOutWithTitle:title];
}

- (void)comeOutWithTitle:(NSString *)title {
   
    [self warnLabelCreat];
    
    [self warnLabelApperaAndDisappearWithTitle:title];
}
#pragma mark - 警告 label 的初始化
- (void)warnLabelCreat {
    _warnLabel = [[UILabel alloc] init];
    _warnLabel.center = CGPointMake(kScreenWidth/2, kScreenHeight/2);
    _warnLabel.bounds = CGRectMake(0, 0, 200, kScreenWidth/10);
    _warnLabel.backgroundColor = [UIColor blackColor];
    _warnLabel.textColor = [UIColor whiteColor];
    _warnLabel.numberOfLines = 0;
    _warnLabel.font = [UIFont systemFontOfSize:15];
    _warnLabel.textAlignment = NSTextAlignmentCenter;
    _warnLabel.layer.cornerRadius = 5.0f;
    _warnLabel.clipsToBounds = YES;
}

#pragma mark - 警告 label 出现又消失的过程
- (void)warnLabelApperaAndDisappearWithTitle:(NSString *)title {
    CGRect rect = [title boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    _warnLabel.bounds = CGRectMake(0, 0, 200+20, rect.size.height+20);
    _warnLabel.text = [NSString stringWithFormat:@"%@",title];
    [[UIApplication sharedApplication].keyWindow addSubview:_warnLabel];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:_warnLabel];
    _warnLabel.alpha = 0;
    [UIView animateWithDuration:1 animations:^{
        _warnLabel.alpha = 0.5;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            _warnLabel.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:3 animations:^{
                [_warnLabel removeFromSuperview];
            }];
        }];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
