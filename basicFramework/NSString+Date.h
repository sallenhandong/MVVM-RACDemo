//
//  NSString+Date.h
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

@property(strong,nonatomic) NSString *dateFormat;

-(NSString *)deltaTimeToNow;

@end
