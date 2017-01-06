//
//  UIImageView+Addition.h
//  NeiHan
//
//  Created by Charles on 16/9/7.
//  Copyright © 2016年 Com.Charles. All rights reserved.
//

#import <UIKit/UIKit.h> 

@interface UIImageView (Addition)

- (instancetype)initWithTarget:(id)target action:( SEL)action;

- (void)addTarget:( id)target action:( SEL)action;

+ (UIImageView *)imageViewWithGIFData:(NSData *)data;

@end
