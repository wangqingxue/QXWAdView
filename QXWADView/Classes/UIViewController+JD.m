//
//  UIViewController+JD.m
//  ADViewProject
//
//  Created by 王庆学 on 2018/1/31.
//  Copyright © 2018年 王庆学. All rights reserved.
//

#import "UIViewController+JD.h"

@implementation UIViewController (JD)

+ (UIViewController *)visibleViewController{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController getVisibleViewControllerFrom:rootViewController];
}

+ (UIViewController *)getVisibleViewControllerFrom:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[UITabBarController class]]){
        UITabBarController *tabController = (UITabBarController *)viewController;
        return [UIViewController getVisibleViewControllerFrom:tabController.selectedViewController];
    }
    else if ([viewController isKindOfClass:[UINavigationController class]]){
        UINavigationController *navController = (UINavigationController *)viewController;
        return [UIViewController getVisibleViewControllerFrom:navController.visibleViewController];
    }
    if (viewController.presentedViewController){
        UIViewController *presentedController = viewController.presentedViewController;
        return [UIViewController getVisibleViewControllerFrom:presentedController];
    }
    return viewController;
}

@end
