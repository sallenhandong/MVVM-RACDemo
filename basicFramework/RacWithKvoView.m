//
//  RacWithKvoView.m
//  basicFramework
//
//  Created by jefactoria on 17/1/10.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "RacWithKvoView.h"

@interface RacWithKvoView ()


@end
@implementation RacWithKvoView

-(void)addChildView{


    self.topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.topView.backgroundColor = blue_color;
    [self addSubview:self.topView];
    
    
    self.clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.clickButton.frame = CGRectMake(25, 35, 50, 50);
    [self.clickButton setTitle:@"点击" forState:UIControlStateNormal];
    [self.clickButton setTitleColor:black_color forState:UIControlStateNormal];
    [self.clickButton addTarget:self action:@selector(changeViewBackGrounColor) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.clickButton];

}

-(void)changeViewBackGrounColor{
    static int i = 0;
    i++;
    if (i%2 == 0) {
        
        self.topView.backgroundColor = blue_color;
    }
    else{
        
       self.topView.backgroundColor = yellow_color;
        
    }

}



@end
