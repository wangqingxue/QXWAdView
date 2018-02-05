//
//  JDAdvertisementManager.h
//  ADViewProject
//
//  Created by 王庆学 on 2018/1/30.
//  Copyright © 2018年 王庆学. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDAdvertisementManager : NSObject

//创建单例
+ (instancetype)sharedAdvertisementManager;

+ (void)addAdvertisementViewWithCompleteBlock:(void(^)(void))completeBlock andCancelBlock:(void(^)(void))cancelBlock;
//倒计时的时间
@property (nonatomic, assign) NSInteger timeCount;

//加载图片url的地址
@property (nonatomic, copy) NSString *urlString;

//加载图片的文件名
@property (nonatomic, copy) NSString *imageName;

@end
