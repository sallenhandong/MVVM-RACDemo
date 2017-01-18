//
//  SAViewProtocol.h
//  SAMvvm
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SAViewProtocol <NSObject>
@optional

/**
 *  将view中的事件通过代理传递出去
 *
 *  @param view   view自己
 *  @param events 所触发事件的一些描述信息
 *  @param url    跳转页面的url地址
 */
- (void)sa_view:(__kindof UIView *)view withEvents:(NSDictionary *)events url:(NSString *)url;


@end
