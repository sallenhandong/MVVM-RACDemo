//
//  BaseViewController.m
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubviews];
    [self bindViewModel];
    [self layoutNavigation];
    [self getNewData];
    
}

#pragma mark - RAC
/**
 *  添加控件
 */
- (void)addSubviews {}

/**
 *  绑定
 */
- (void)bindViewModel {}

/**
 *  设置navation
 */
- (void)layoutNavigation {}

/**
 *  初次获取数据
 */
- (void)getNewData {}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
