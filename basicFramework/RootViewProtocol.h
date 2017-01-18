//
//  RootViewProtocol.h
//  basicFramework
//
//  Created by jefactoria on 17/1/4.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RootViewProtocol <NSObject>

@optional

-(instancetype)initWithFrame:(CGRect)frame;
/**添加视图*/
-(void)addChildView;
@end
