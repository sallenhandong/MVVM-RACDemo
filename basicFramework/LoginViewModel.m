//
//  LoginViewModel.m
//  sallenReactiveCocoa
//
//  Created by jefactoria on 16/12/28.
//  Copyright © 2016年 djmulder. All rights reserved.
//

#import "LoginViewModel.h"
@interface TanLoginViewModel : NSObject

@end
@implementation LoginViewModel
-(instancetype)init
{
    if (self = [super init]) {
        
        
        
        //RACObserve(self, name) ：监听某个对象的某个属性,返回的是信号。
        //map方法，将会创建一个和原来一模一样的信号，只不过新的信号传递的值变为了block（value）。
        RACSignal *userNameLengthSig = [RACObserve(self, userName)
                                        map:^id(NSString *value) {
                                            if (value.length >= 11)
                                                return @(YES);
                                            return @(NO);
                                        }];
        RACSignal *passwordLengthSig = [RACObserve(self, password)
                                        map:^id(NSString *value) {
                                            if (value.length >= 6) return @(YES);
                                            return @(NO);
                                        }];
 
        
        //combineLatest:将多个信号合并起来，并且拿到各个信号的最新的值,必须每个合并的signal至少都有过一次sendNext，才会触发合并的信号。
        RACSignal *loginBtnEnable = [RACSignal combineLatest:@[userNameLengthSig, passwordLengthSig] reduce:^id(NSNumber *userName, NSNumber *password){
            return @([userName boolValue] && [password boolValue]);
        }];
        
        
        //RACCommand第二种创建方式 需要传进一个能传递BOOL事件的RACSignal，这个signal的作用相当于过滤，当传递的布尔事件为真值时，command能够执行，反之则不行。
        //button的enable属性会随command的可执行性而改变，意思是当传递布尔事件的信号传递了真值事件，按钮才可使用。另外，当你按下按钮，command开始执行时，按钮的enable被自动设置成了NO，除非command执行完了，怎么判断command执行完成了呢？就是当其伴随的signal发送完成事件的时候
        
        _loginCommand = [[RACCommand alloc]initWithEnabled:loginBtnEnable signalBlock:^RACSignal *(id input) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    //模拟网络请求
                    
                    [subscriber sendNext:@"pop"];
                    [subscriber sendCompleted];
                    
                    
                });
                return nil;
            }];
        }];
    }
    return self;
}

@end
