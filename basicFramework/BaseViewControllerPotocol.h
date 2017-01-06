//
//  BaseViewControllerPotocol.h
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol BaseViewControllerPotocol <NSObject>
@optional
/**
 *  绑定
 */
- (void)bindViewModel;

/**
 *  添加控件
 */
- (void)addSubviews;
/**
 *  设置navation
 */
- (void)layoutNavigation;
/**
 *  初次获取数据
 */
- (void)getNewData;
@end
