//
//  UILabel+Addition.h
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Addition)
- (instancetype)initWithTitle:(NSString *)title
                         font:(UIFont *)font
                   textColor:(UIColor *)textColor
               textAlignment:(NSTextAlignment)textAlignment;

+ (instancetype)labelWithTitle:(NSString *)title
                          font:(UIFont *)font
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment;
@end
