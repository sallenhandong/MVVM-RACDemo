//
//  LoginViewModel.h
//  sallenReactiveCocoa
//
//  Created by jefactoria on 16/12/28.
//  Copyright © 2016年 djmulder. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface LoginViewModel : NSObject
@property(nonatomic, copy) NSString *userName;
@property(nonatomic, copy) NSString *password;
/**
 *RACCommand RAC中用于处理事件的类，可以把事件如何处理,事件中的数据如何传递，包装到这个类中，他可以很方便的监控事件的执行过程。
    一般来说是在UI上的某些动作来触发这些事件，比如点击一个按钮。RACCommand的实例能够决定是否可以被执行，这个特性能反应在UI上，而且它能确保在其不可用时不会被执行
 */
@property(nonatomic, strong, readonly) RACCommand *loginCommand;
@end
