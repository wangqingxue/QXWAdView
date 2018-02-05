//
//  QXWViewController.m
//  QXWADView
//
//  Created by 173636717@qq.com on 02/05/2018.
//  Copyright (c) 2018 173636717@qq.com. All rights reserved.
//

#import "QXWViewController.h"
#import <QXWADView/QXWAdView.h>

@interface QXWViewController ()

@end

@implementation QXWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [JDAdvertisementManager addAdvertisementViewWithCompleteBlock:^{
        NSLog(@"完成了点击按钮");
    } andCancelBlock:^{
        NSLog(@"点击了取消按钮");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
