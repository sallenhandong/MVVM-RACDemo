//
//  AppDelegate+Logging.m
//  basicFramework
//
//  Created by jefactoria on 17/1/12.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "AppDelegate+Logging.h"
#import "BaseLogging.h"
@implementation AppDelegate (Logging)
- (void)setupLogging
{
    NSDictionary *config = @{
                             @"AopView": @{
                                     GLLoggingPageImpression: @"page imp - main page",
                                     GLLoggingTrackedEvents: @[
                                             @{
                                                 GLLoggingEventName: @"blue Button Click",
                                                 GLLoggingEventSelectorName: @"blueButtonClick",
                                                 GLLoggingEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"blue Button Click");
                                                 },
                                                 },
                                             @{
                                                 GLLoggingEventName: @"red Button Click",
                                                 GLLoggingEventSelectorName: @"redButtonClick",
                                                 GLLoggingEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"red Button Click");
                                                 },
                                                 },
                                             ],
                                     },
                             
                             };
    
    [BaseLogging setupWithConfiguration:config];
}
@end
