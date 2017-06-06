//
//  AppleAPIHelper+Event.h
//  NewFrame
//
//  Created by 张超 on 2017/6/5.
//  Copyright © 2017年 orzer. All rights reserved.
//

#import "AppleAPIHelper.h"

NS_ASSUME_NONNULL_BEGIN

@import EventKit;
@interface AppleAPIHelper (Event)
{
    
}


/**
 获取权限状态

 @param type 事件类型，EKEntityTypeEvent 或者 EKEntityTypeReminder
 @return 是否有权限
 */
- (BOOL)APH_AccessForEventKit:(EKEntityType)type;


/**
 日历事件授权

 @param type 事件类型
 @param result 结果block
 */
- (void)APH_AccessForEventKitType:(EKEntityType)type result:(void(^)(BOOL))result;

/**
 获取类型的Source

 @param type 事件类型
 @return Source
 */
- (EKSource*)APH_SourceWithType:(EKSourceType)type;


/**
 获取某个类型全部的日历

 @param type 事件类型
 @return 日历数组
 */
- (NSArray*)APH_CalendarWithType:(EKEntityType)type;


/**
 通过UserDefault获取日历的id

 @param key 键
 @return id
 */
- (nullable NSString *)APH_CalendarIdentifierWithKey:(NSString *)key;


/**
 通过UserDefault保存日历的id
 
 @param identifier id
 @param key 键
 */
- (void)APH_SetIdentifier:(NSString *)identifier withCalendarKey:(NSString *)key;


/**
 通过id创建或者获取日历

 @param identifier id
 @param type 日历类型
 @param createBlock 新日历配置block
 @return 日历实例
 */
- (EKCalendar *)APH_CreateOrGetCalendarWithIdentifier:(NSString *)identifier type:(EKEntityType)type createBlock:(void (^)(EKCalendar* calendar))createBlock;

@end

NS_ASSUME_NONNULL_END
