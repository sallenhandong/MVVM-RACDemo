//
//  UILabel+Addition.m
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)
- (instancetype)initWithTitle:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment{
    if (self = [super init]) {
        self.text = title;
        self.font = font;
        self.textAlignment = textAlignment ? textAlignment : NSTextAlignmentLeft;
        self.textColor = textColor;
    }
    return self;
}

+ (instancetype)labelWithTitle:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment{
    return [[UILabel alloc]initWithTitle:title font:font textColor:textColor textAlignment:textAlignment];
}
@end
