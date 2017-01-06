//
//  UITableViewCell+SAConfigure.m
//  SAMvvm
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UITableViewCell+SAConfigure.h"

@implementation UITableViewCell (SAConfigure)

#pragma mark -- private
+ (UINib *)nibWithIdentifier:(NSString *)identifier
{
    return [UINib nibWithNibName:identifier bundle:nil];
}

#pragma mark - public
+ (void)sa_registerTable:(UITableView *)table
            nibIdentifier:(NSString *)identifier
{
    [table registerNib:[self nibWithIdentifier:identifier] forCellReuseIdentifier:identifier];
}
+ (void)sa_registerTable:(UITableView *)table
          classIdentifier:(NSString *)identifier
{
    [table registerClass:[self class] forCellReuseIdentifier:identifier];
}
#pragma mark --
#pragma mark - Rewrite these func in SubClass !
- (void)sa_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath
{
    // Rewrite this func in SubClass !
}

- (void)sa_configure:(UITableViewCell *)cell viewModel:(id<SAViewModelProtocol>)viewModel indexPath:(NSIndexPath *)indexPath
{
    // Rewrite this func in SubClass !
}

+ (CGFloat)sa_getCellHeightWithModel:(id)model indexPath:(NSIndexPath *)indexPath
{
    // Rewrite this func in SubClass if necessary
    if (!model) {
        return 0.0f ; // if obj is null .
    }
    return 44.0f ; // default cell height
}

@end
