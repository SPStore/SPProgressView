//
//  ViewController.m
//  SPProgressView
//
//  Created by 乐升平 on 2018/11/9.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "ViewController.h"
#import "SPBarProgressView.h"
#import "MBProgressHUD.h"

@interface ViewController ()
@property (nonatomic, strong) SPBarProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.progressView];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = @"正在上传图片...";
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = _progressView;
    hud.label.font = [UIFont systemFontOfSize:14];
    
    // 模拟下载进度
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(progressSimulation) userInfo:self repeats:YES];

}

- (void)progressSimulation {
    static CGFloat progress = 0;
    if (progress < 1.0) {
        progress += 0.01;
        // 循环
        if (progress >= 1.0) progress = 0;
        _progressView.progress = progress; // 在MBProgressHUD里，进度值的赋值要保证在设置customView之后
    }
}


- (SPBarProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[SPBarProgressView alloc] init];
        _progressView.progressColor = [UIColor redColor];
        _progressView.progressRemainingColor = [UIColor greenColor];
        _progressView.lineColor = [UIColor blackColor];
        _progressView.backgroundColor = [UIColor clearColor];
        _progressView.lineWidth = 1;
    }
    return _progressView;
}

@end
