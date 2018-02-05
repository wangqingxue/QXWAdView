//
//  UIViewController+JD.h
//  ADViewProject
//
//  Created by 王庆学 on 2018/1/31.
//  Copyright © 2018年 王庆学. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JD)

+ (UIViewController *)visibleViewController;

+ (UIViewController *)getVisibleViewControllerFrom: (UIViewController *)viewController;

@end
