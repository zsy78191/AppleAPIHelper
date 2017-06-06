//
//  CocoaAPICheckHelper.h
//  mframe
//
//  Created by 张超 on 2017/4/13.
//  Copyright © 2017年 orzer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CACH : NSObject


/**
 检查类型是否存在

 @param className 类型名称
 @return 是否存在
 */
+ (BOOL)checkClass:(NSString*)className;

/**
 检查类型和方法是否存在

 @param className 类型名称
 @return 是否存在
*/
+ (BOOL)checkClass:(NSString*)className sel:(SEL)aSelector;

@end
