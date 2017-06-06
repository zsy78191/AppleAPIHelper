//
//  CocoaAPICheckHelper.m
//  mframe
//
//  Created by 张超 on 2017/4/13.
//  Copyright © 2017年 orzer. All rights reserved.
//

#import "CocoaAPICheckHelper.h"

@implementation CACH

+ (BOOL)checkClass:(NSString *)className sel:(SEL)aSelector
{
    if(![CACH checkClass:className]) return NO;
    Class cls = NSClassFromString(className);
    return [[cls class] respondsToSelector:aSelector];
}

+ (BOOL)checkClass:(NSString *)className
{
    Class cls = NSClassFromString(className);
    if (!cls) {
        return NO;
    }
    return YES;
}

@end
