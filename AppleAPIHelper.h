//
//  AppleReviewHelper.h
//  mframe
//
//  Created by 张超 on 2017/4/13.
//  Copyright © 2017年 orzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class EKEventStore;
NS_ASSUME_NONNULL_BEGIN

@protocol SKStoreProductViewControllerDelegate;

@interface AppleAPIHelper : NSObject


/**
 调用系统评分，iOS 10开始支持
 
 @return 系统是否支持
 */
+ (BOOL)RequestAppleReview;


/**
 调用系统振动反馈，iOS 10开始支持
 
 @param style 反馈强度
 */
+ (void)HapticFeedback:(UIImpactFeedbackStyle)style;



/**
 软件内打开商店页面

 @param appId 应用的AppID
 @param vc 当前的ViewController
 @param finish 结果block
 */
+ (void)openAppStore:(NSString *)appId vc:(id<SKStoreProductViewControllerDelegate>)vc complate:(void (^)(BOOL))finish;


/**
 操作系统日历的Store实例
 */
@property (nonatomic, strong) EKEventStore* store;

@end


NS_ASSUME_NONNULL_END
