//
//  JDAdvertisementView.h
//  ADViewProject
//
//  Created by 王庆学 on 2018/1/30.
//  Copyright © 2018年 王庆学. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDAdvertisementView : UIView
//倒计时的时间
@property (nonatomic, assign) NSInteger timeCount;

//加载图片url的地址
@property (nonatomic, copy) NSString *urlString;

//加载图片的文件名
@property (nonatomic, copy) NSString *imageName;

//倒计时完成调用的block
@property (nonatomic, copy) void(^completeBlock)(void);

//取消按钮点击回调block
@property (nonatomic, copy) void(^cancelBlock)(void);

- (void)showMe;

- (void)setImageWithImagePath:(NSString *)imagePath;

@end
