//
//  UIView+SAConfigure.h
//  SAMvvm
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAViewModelProtocol.h"
@interface UIView (SAConfigure)
/**
 *  根据model配置UIView，设置UIView内容
 */
- (void)sa_configureViewWithModel:(id)model;

/**
 *  根据viewModel配置UIView，设置UIView内容
 */
- (void)sa_configureViewWithViewModel:(id<SAViewModelProtocol>)viewModel;


@end
