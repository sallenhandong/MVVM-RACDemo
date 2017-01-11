//
//  HomeTableViewCell.h
//  basicFramework
//
//  Created by jefactoria on 17/1/11.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : RootTableViewCell
@property (nonatomic,strong) UILabel *titleLabel;
-(void)cellAutoLayoutHeight:(NSString *)title;
@end
