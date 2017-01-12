//
//  BaseLogging.h
//  basicFramework
//
//  Created by jefactoria on 17/1/12.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GLLoggingPageImpression @"GLLoggingPageImpression"
#define GLLoggingTrackedEvents @"GLLoggingTrackedEvents"
#define GLLoggingEventName @"GLLoggingEventName"
#define GLLoggingEventSelectorName @"GLLoggingEventSelectorName"
#define GLLoggingEventHandlerBlock @"GLLoggingEventHandlerBlock"

@interface BaseLogging : NSObject
+ (void)setupWithConfiguration:(NSDictionary *)configs;
@end
