//
//  GAViewManager.m
//  basicFramework
//
//  Created by jefactoria on 16/12/30.
//  Copyright © 2016年 xiexing. All rights reserved.
//

#import "GAViewManager.h"

@implementation GAViewManager

-(void)sa_view:(__kindof UIView *)view withEvents:(NSDictionary *)events url:(NSString *)url{

    if ([events objectForKey:@"pushThird"]){
        
        NSString *urlStr = @"";
        if ([[events objectForKey:@"pushThird"] isEqualToString:@"kvo"]) {
            
            urlStr = [NSString stringWithFormat:@"%@?title=点击",url];
        }else{
            
            urlStr = [NSString stringWithFormat:@"%@?title=合并",url];
        }
        [DCURLRouter pushURLString:urlStr animated:YES];
        
    }else{
        
        [DCURLRouter pushURLString:url animated:YES];
        
        
        // 拿到当前控制器
        UIViewController *currentController = [DCURLRouter sharedDCURLRouter].currentViewController;
        
        UIViewController *aop = [[[currentController class]alloc]init];

//        currentController.NextViewControllerBlock = ^(NSString *tfText){
//        
//        
//            
//            
//            
//        
//        }
        
//        NSLog(@"%@",[currentController class]);
        
    }
}



@end
