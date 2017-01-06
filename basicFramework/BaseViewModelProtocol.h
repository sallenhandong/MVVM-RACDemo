//
//  BaseViewModelProtocol.h
//  basicFramework
//
//  Created by jefactoria on 17/1/4.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequest.h"
@protocol BaseViewModelProtocol <NSObject>

@optional
- (instancetype)initWithModel:(id)model;
@property (strong, nonatomic)BaseRequest *request;

/**
 *  初始化
 */
- (void)initialize;
@end
