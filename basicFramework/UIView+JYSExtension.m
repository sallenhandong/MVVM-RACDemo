//
//  UIView+JYSExtension.m
//  WoYaoJiaYou
//
//  Created by jefactoria on 16/6/8.
//  Copyright © 2016年 jefactoria. All rights reserved.
//

#import "UIView+JYSExtension.h"

@implementation UIView (JYSExtension)

/**************** get方法 *******************/

- (CGFloat)gt_minX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)gt_minY {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)gt_midX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)gt_midY {
    return CGRectGetMidY(self.frame);
}

- (CGFloat)gt_maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)gt_maxY {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)gt_width {
    return CGRectGetWidth(self.frame);
}

- (CGFloat)gt_height {
    return CGRectGetHeight(self.frame);
}

- (CGSize)gt_size {
    return self.bounds.size;
}

- (CGPoint)gt_origin {
    return self.frame.origin;
}


/**************** set方法 *******************/

- (void)setGt_minX:(CGFloat)gt_minX {
    CGRect rect = self.frame;
    rect.origin.x = gt_minX;
    self.frame = rect;
}

- (void)setGt_minY:(CGFloat)gt_minY {
    CGRect rect = self.frame;
    rect.origin.y = gt_minY;
    self.frame = rect;
}

- (void)setGt_midX:(CGFloat)gt_midX {
    CGPoint point = self.center;
    point.x = gt_midX;
    self.center = point;
}

- (void)setGt_midY:(CGFloat)gt_midY {
    
    CGPoint point = self.center;
    point.y = gt_midY;
    self.center = point;
}

- (void)setGt_maxX:(CGFloat)gt_maxX {
    
    CGRect rect = self.frame;
    rect.origin.x = gt_maxX - self.gt_width;
    self.frame = rect;
}

- (void)setGt_maxY:(CGFloat)gt_maxY {
    
    CGRect rect = self.frame;
    rect.origin.y = gt_maxY - self.gt_height;
    self.frame = rect;
}

- (void)setGt_width:(CGFloat)gt_width {
    
    CGRect rect = self.frame;
    rect.size.width = gt_width;
    self.frame = rect;
}

- (void)setGt_height:(CGFloat)gt_height {
    
    CGRect rect = self.frame;
    rect.size.height = gt_height;
    self.frame = rect;
}

- (void)setGt_size:(CGSize)gt_size {
    
    CGRect rect = self.frame;
    rect.size = gt_size;
    self.frame = rect;
}

- (void)setGt_origin:(CGPoint)gt_origin {
    
    CGRect rect = self.frame;
    rect.origin = gt_origin;
    self.frame = rect;
}

/**************** 屏幕 *******************/
- (CGFloat)gt_screenW {
    return CGRectGetWidth([UIScreen mainScreen].bounds);
}

- (CGFloat)gt_screenH {
    return CGRectGetHeight([UIScreen mainScreen].bounds);
}

@end


@implementation UIView (image)

- (UIImage *)imageByViewshots {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self.layer renderInContext:ctx];
    
    UIImage *screenshots = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return screenshots;
}

@end

@implementation UIView (responder)


- (UIViewController *)viewController {
    
    UIResponder *next = self.nextResponder;
    
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    } while (next != nil);
    
    return nil;
}

@end



