//
//  AppleAPIHelper+Event.m
//  NewFrame
//
//  Created by 张超 on 2017/6/5.
//  Copyright © 2017年 orzer. All rights reserved.
//

#import "AppleAPIHelper+Event.h"

NS_ASSUME_NONNULL_BEGIN


@implementation AppleAPIHelper (Event)


- (void)APH_AccessForEventKitType:(EKEntityType)type result:(void(^)(BOOL))result
{
    [self.store requestAccessToEntityType:type completion:^(BOOL granted, NSError * _Nullable error) {
        if (!granted) {
            NSLog(@"%@",error);
        }
        if (result) {
            result(granted);
        }
    }];
}

- (BOOL)APH_AccessForEventKit:(EKEntityType)type
{
    return [EKEventStore authorizationStatusForEntityType:type] == EKAuthorizationStatusAuthorized;
}

- (NSArray*)APH_CalendarWithType:(EKEntityType)type
{
    return [self.store calendarsForEntityType:type];
}

- (EKSource*)APH_SourceWithType:(EKSourceType)type
{
    EKSource *localSource = nil;
    NSLog(@"source %@",self.store.sources);
    for (EKSource *source in self.store.sources)
    {
        if (source.sourceType == type)
        {
            localSource = source;
            break;
        }
    }
    return localSource;
}

- (nullable NSString *)APH_CalendarIdentifierWithKey:(NSString *)key
{
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    NSString* calendarIdentifier = [def valueForKey:key];
    return calendarIdentifier;
}

- (void)APH_SetIdentifier:(NSString *)identifier withCalendarKey:(NSString *)key
{
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    [def setValue:identifier forKey:key];
    [def synchronize];
}

- (EKCalendar *)APH_CreateOrGetCalendarWithIdentifier:(NSString *)identifier type:(EKEntityType)type createBlock:(void (^)(EKCalendar* calendar))createBlock;
{
    if (identifier) {
        EKCalendar* calendar = [self.store calendarWithIdentifier:identifier];
        if (calendar) {
            return calendar;
        }
    }
    EKCalendar* calendar = [EKCalendar calendarForEntityType:type eventStore:self.store];
    if(createBlock)
    {
        createBlock(calendar);
    }
    return calendar;
}



@end

NS_ASSUME_NONNULL_END
