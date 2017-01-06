//
//  UITableViewCell+SAConfigure.h
//  SAMvvm
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAViewModelProtocol.h"

@interface UITableViewCell (SAConfigure)
/**
 *  从nib文件中根据重用标识符注册UITableViewCell
 */
+ (void)sa_registerTable:(UITableView *)table
            nibIdentifier:(NSString *)identifier;

/**
 *  从class中根据重用标识符注册UITableViewCell
 */
+ (void)sa_registerTable:(UITableView *)table
          classIdentifier:(NSString *)identifier;

/**
 *  根据model配置UITableViewCell，设置UITableViewCell内容
 */
- (void)sa_configure:(UITableViewCell *)cell
                model:(id)model
            indexPath:(NSIndexPath *)indexPath;

/**
 *  根据viewModel配置UITableViewCell，设置UITableViewCell内容
 */
- (void)sa_configure:(UITableViewCell *)cell
            viewModel:(id<SAViewModelProtocol>)viewModel
            indexPath:(NSIndexPath *)indexPath;

/**
 *  获取自定义对象的cell高度 (已集成UITableView+FDTemplateLayoutCell，现在创建的cell自动计算高度)
 */
+ (CGFloat)sa_getCellHeightWithModel:(id)model
                            indexPath:(NSIndexPath *)indexPath ;
@end
