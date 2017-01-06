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

    if ([events objectForKey:@"push"]) {
       NSString *urlStr = [NSString stringWithFormat:@"dariel://LoginViewController"];
        [DCURLRouter pushURLString:urlStr animated:YES];
    }
}



@end
