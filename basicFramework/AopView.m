//
//  AopView.m
//  basicFramework
//
//  Created by jefactoria on 17/1/12.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "AopView.h"
@interface AopView ()
@property (nonatomic,strong) UIButton *blueButton;
@property (nonatomic,strong) UIButton *redButton;
@end
@implementation AopView

-(void)addChildView{

    self.blueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.blueButton setTitle:@"BLUE" forState:UIControlStateNormal];
    [self.blueButton setTitleColor:white_color forState:UIControlStateNormal];
    [self.blueButton setBackgroundColor:[UIColor colorWithHexString:@"3182D9"]];
    [self.blueButton addTarget:self action:@selector(blueButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.blueButton];
    
    self.redButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.redButton setTitle:@"RED" forState:UIControlStateNormal];
    [self.redButton setTitleColor:white_color forState:UIControlStateNormal];
    [self.redButton setBackgroundColor:[UIColor colorWithHexString:@"C93F45"]];
    [self.redButton addTarget:self action:@selector(redButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.redButton];
    [self setNeedsUpdateConstraints];
    [self updateConstraints];

}
-(void)updateConstraints{

    self.blueButton.sd_layout.leftEqualToView(self).topSpaceToView(self,64).widthIs(SCREEN_WIDTH/2).heightIs(80);
    self.redButton.sd_layout.leftSpaceToView(self.blueButton,0).topSpaceToView(self,64).widthIs(SCREEN_WIDTH/2).heightIs(80);
    [super updateConstraints];
}
-(void)blueButtonClick{

}
-(void)redButtonClick{

}

@end
