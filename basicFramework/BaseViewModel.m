//
//  BaseViewModel.m
//  basicFramework
//
//  Created by jefactoria on 17/1/4.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

@synthesize request  = _request;
+ (instancetype)alloc {

    BaseViewModel *viewModel =[super alloc];
    if (viewModel) {
        
        [viewModel initialize];
    }

    return viewModel;

}

- (instancetype)initWithModel:(id)model {
    
    self = [super init];
    if (self) {
    }
    return self;
}

- (BaseRequest *)request{

    if (!_request) {
        _request = [[BaseRequest alloc]init];
    }

    return _request;
}

- (void)initialize{




}
@end
