//
//  AppleReviewHelper.m
//  mframe
//
//  Created by 张超 on 2017/4/13.
//  Copyright © 2017年 orzer. All rights reserved.
//

#import "AppleAPIHelper.h"
#import <StoreKit/SKStoreReviewController.h>
#import <UserNotifications/UserNotifications.h>
#import "CocoaAPICheckHelper.h"
@import EventKit;
@import StoreKit;


@implementation AppleAPIHelper

+ (BOOL)RequestAppleReview
{
    if(![CACH checkClass:@"SKStoreReviewController" sel:@selector(requestReview)])
    {
        return NO;
    }
    [SKStoreReviewController requestReview];
    return YES;
}

+ (void)HapticFeedback:(UIImpactFeedbackStyle)style
{
    if(![CACH checkClass:@"UIImpactFeedbackGenerator"])
    {
        NSLog(@"UIImpactFeedbackGenerator is not work for this version system");
        return;
    }
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: style];
    [generator prepare];
    [generator impactOccurred];
}


+ (void)openAppStore:(NSString *)appId vc:(id<SKStoreProductViewControllerDelegate>)vc complate:(void (^)(BOOL))finish
{
    if(![CACH checkClass:@"SKStoreProductViewController" sel:@selector(requestReview)])
    {
        NSLog(@"SKStoreProductViewController is not work for this version system");
        return;
    }
    SKStoreProductViewController *storeProductVC = [[SKStoreProductViewController alloc] init];
    storeProductVC.delegate = vc;
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:appId forKey:SKStoreProductParameterITunesItemIdentifier];
    [storeProductVC loadProductWithParameters:dict completionBlock:^(BOOL result, NSError *error)
     {
         if (result)
         {
             [(UIViewController*)vc presentViewController:storeProductVC animated:YES completion:nil];
             if(finish)
             {
                 finish(YES);
             }
         }
         else {
             if(finish)
             {
                 finish(NO);
             }
         }
     }];
}

- (EKEventStore *)store
{
    if (!_store) {
        _store = [[EKEventStore alloc] init];
    }
    return _store;
}
 


@end
