//
//  BaseViewProtocol.h
//  basicFramework
//
//  Created by jefactoria on 17/1/6.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol;

@protocol BaseViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <BaseViewModelProtocol>)viewModel;

- (void)bindViewModel;
- (void)setupViews;



@end
