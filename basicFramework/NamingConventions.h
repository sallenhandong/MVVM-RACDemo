//
//  NamingConventions.h
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//
/**
 *  OC常用命名规范
 */

/**
 *  数组和字典的元素垂直写
 */
//    NSArray *array = @[@"a",
//                       @"b",
//                       @"c"
//                       ];
//
//
//    NSDictionary *dictionary = @{@"a":@"",
//                                 @"b":@"",
//                                 @"c":@"",
//                                 @"d":@"",
//                                 };

/**
 *  不允许外接修改的属性要设置readonly
 
 大家平时设置属性默认是可读可写 但是这样容易对于别人造成误解 以为可以赋值
 
 对于只能获取的属性 一定写readonly
 */

//@property (nonatomic,copy,readonly) NSString *name;

















