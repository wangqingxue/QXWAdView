//
//  JDAdvertisementManager.m
//  ADViewProject
//
//  Created by 王庆学 on 2018/1/30.
//  Copyright © 2018年 王庆学. All rights reserved.
//

#import "JDAdvertisementManager.h"
#import "JDAdvertisementView.h"
#import "QXWDefine.h"

@interface JDAdvertisementManager ()

@property (nonatomic, weak) JDAdvertisementView *advertiseMentView;
@property (nonatomic, copy) NSString *currentImagePath;

@end

@implementation JDAdvertisementManager

+ (void)addAdvertisementViewWithCompleteBlock:(void(^)(void))completeBlock andCancelBlock:(void(^)(void))cancelBlock{
    [[JDAdvertisementManager sharedAdvertisementManager] createAdvertiseMentViewWithCompleteBlock:completeBlock andCancelBlock:cancelBlock];
}

+ (instancetype)sharedAdvertisementManager{
    static JDAdvertisementManager *jdAdvertisementManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jdAdvertisementManager = [[JDAdvertisementManager alloc]init];
    });
    return jdAdvertisementManager;
}

- (void)createAdvertiseMentViewWithCompleteBlock:(void(^)(void))completeBlock andCancelBlock:(void(^)(void))cancelBlock{
    JDAdvertisementView *advertisementView = [[JDAdvertisementView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.advertiseMentView = advertisementView;
    advertisementView.completeBlock = completeBlock;
    advertisementView.cancelBlock = cancelBlock;
    advertisementView.timeCount = self.timeCount;
    [advertisementView showMe];
}

- (void)setImageName:(NSString *)imageName{
    NSString *imagePath = [[NSBundle mainBundle]pathForResource:imageName ofType:@"png"];
    [self.advertiseMentView setImageWithImagePath:imagePath];
}

- (void)setUrlString:(NSString *)urlString{
    NSString *oldImageName = [[NSUserDefaults standardUserDefaults] objectForKey:kQXWPageImageNameKey];
    NSString *imageName = [[urlString componentsSeparatedByString:@"/"]lastObject];
    if (!oldImageName || ![oldImageName isEqualToString:imageName]){
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        UIImage *image = [UIImage imageWithData:data];
        
        NSString *filePath = [self getFilePathWithImageName:imageName];
        BOOL ret = [UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES];
        if (ret)    [self.advertiseMentView setImageWithImagePath:filePath];
    }
}

- (NSString *)getFilePathWithImageName:(NSString *)imageName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths.firstObject stringByAppendingPathComponent:imageName];
}

- (void)updateLocalADWithImageName:(NSString *)imageName{
    [self deleteOldImage];
    [[NSUserDefaults standardUserDefaults] setObject:imageName forKey:kQXWPageImageNameKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)deleteOldImage{
    NSString *imageName = [[NSUserDefaults standardUserDefaults] objectForKey:kQXWPageImageNameKey];
    if (imageName){
        NSString *filePath = [self getFilePathWithImageName:imageName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([self isFileExistWithFilePath:filePath]){
            [fileManager removeItemAtPath:filePath error:nil];
        }
    }
}

- (BOOL)isFileExistWithFilePath:(NSString *)filePath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = NO;
    return [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
}

@end
