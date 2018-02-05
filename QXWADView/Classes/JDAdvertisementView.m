//
//  JDAdvertisementView.m
//  ADViewProject
//
//  Created by 王庆学 on 2018/1/30.
//  Copyright © 2018年 王庆学. All rights reserved.
//

#import "JDAdvertisementView.h"
#import "JDAdvertisement.h"
#import "UIViewController+JD.h"

@interface JDAdvertisementView ()

@property (nonatomic, strong) UIImageView *baseImageView;

@property (nonatomic, strong) UITapGestureRecognizer *imageTapGesture;

@property (nonatomic, strong) NSTimer *baseTimer;

@property (nonatomic, strong) UIButton *jumpBtn;

@end

@implementation JDAdvertisementView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}

- (void)initUI{
    self.baseImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    [self.baseImageView addGestureRecognizer:self.imageTapGesture];
    self.baseImageView.userInteractionEnabled = YES;
    [self addSubview:self.baseImageView];
    self.jumpBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 40, 80, 40)];
    self.jumpBtn.backgroundColor = [UIColor greenColor];
    [self.jumpBtn addTarget:self action:@selector(closeADView) forControlEvents:UIControlEventTouchUpInside];
    [self.baseImageView addSubview:self.jumpBtn];
    [self startTimer];
}

- (void)startTimer{
    [[NSRunLoop currentRunLoop]addTimer:self.baseTimer forMode:NSDefaultRunLoopMode];
}

- (void)imageViewClick{
    if (self.completeBlock) self.completeBlock();
}

- (void)closeADView{
    if (self.cancelBlock) self.cancelBlock();
    [self removeFromSuperview];
    [self.baseTimer invalidate];
    self.baseTimer = nil;
}

- (void)showMe{
    UIWindow *baseWindow = [UIApplication sharedApplication].delegate.window;
    [baseWindow addSubview:self];
}

- (void)setImageWithImagePath:(NSString *)imagePath{
    self.baseImageView.image = [UIImage imageWithContentsOfFile:imagePath];
}

#pragma mark --set
- (void)setUrlString:(NSString *)urlString{
    
}

- (void)setImageName:(NSString *)imageName{
    
}

#pragma mark --get
- (NSTimer *)baseTimer{
    NSInteger __block baseInteger = self.timeCount ? self.timeCount : 5;
    if (!_baseTimer){
        _baseTimer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self.jumpBtn setTitle:[NSString stringWithFormat:@"剩余%ld",baseInteger] forState:UIControlStateNormal];
            baseInteger --;
            if (baseInteger < 0) [self closeADView];
        }];
    }
    return _baseTimer;
}

- (UITapGestureRecognizer *)imageTapGesture{
    if (!_imageTapGesture){
        _imageTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewClick)];
    }
    return _imageTapGesture;
}

- (void)dealloc{
    NSLog(@"ad广告页面已经被销毁了");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
