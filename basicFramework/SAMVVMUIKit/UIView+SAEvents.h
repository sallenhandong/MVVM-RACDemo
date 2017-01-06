//
//  UIView+SAEvents.h
//  SAMvvm
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAViewManagerProtocol.h"
#import "SAViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^ViewEventsBlock)( );

@interface UIView (SAEvents)

/**
 *  viewDelegate 传递事件
 */
@property (nullable, nonatomic, weak) id<SAViewProtocol> viewDelegate;

/**
 *  block 传递事件
 */
@property (nonatomic, copy) ViewEventsBlock viewEventsBlock;

/**
 *  将view中的事件交由viewManger处理
 */
- (void)sa_viewWithViewManger:(id<SAViewProtocol>)viewManger;

@end
NS_ASSUME_NONNULL_END
