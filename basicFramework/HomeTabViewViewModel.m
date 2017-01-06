//
//  HomeTabViewViewModel.m
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "HomeTabViewViewModel.h"

@implementation HomeTabViewViewModel
- (RACSubject *)cellClickSubJect {
    
    if (!_cellClickSubJect) {
        
        _cellClickSubJect = [RACSubject subject];
    }
    
    return _cellClickSubJect;
}

- (RACCommand *)cellClickCommand{


    if (!_cellClickCommand) {
        
        _cellClickCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [subscriber sendNext:@"change"];
                    [subscriber sendCompleted];
                });
                return nil;
            }];
            
        }];
    }
    return _cellClickCommand;
}



@end
