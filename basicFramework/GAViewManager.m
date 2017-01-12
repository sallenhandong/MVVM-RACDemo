//
//  GAViewManager.m
//  basicFramework
//
//  Created by jefactoria on 16/12/30.
//  Copyright © 2016年 xiexing. All rights reserved.
//

#import "GAViewManager.h"

@implementation GAViewManager

-(void)sa_view:(__kindof UIView *)view withEvents:(NSDictionary *)events{

    if ([[events objectForKey:@"push"] isEqualToString:@"push"]) {
       NSString *urlStr = [NSString stringWithFormat:@"dariel://LoginViewController"];
        [DCURLRouter pushURLString:urlStr animated:YES];
    }else if ([events objectForKey:@"pushThird"]){
    
        NSString *urlStr = @"";
        if ([[events objectForKey:@"pushThird"] isEqualToString:@"kvo"]) {
            
          urlStr = [NSString stringWithFormat:@"dariel://ThirdViewController?title=点击"];
        }else{
        
          urlStr = [NSString stringWithFormat:@"dariel://ThirdViewController?title=合并"];
        }
        [DCURLRouter pushURLString:urlStr animated:YES];
       
    }else if ([events objectForKey:@"pushAOP"]){
    
        NSString *urlStr = [NSString stringWithFormat:@"dariel://AOPViewController"];
        [DCURLRouter pushURLString:urlStr animated:YES];
 
    }
}



@end
