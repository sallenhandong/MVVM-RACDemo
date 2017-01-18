//
//  BaseView.m
//  basicFramework
//
//  Created by jefactoria on 17/1/6.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    
    self = [super init];
    if (self) {
        
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}
/**绑定*/
- (void)bindViewModel {
}
/**添加视图*/
- (void)setupViews {
}

@end
