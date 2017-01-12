//
//  HomeView.m
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "HomeView.h"

@interface HomeView ()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *headImage;
@property (nonatomic,strong) UIButton *changeImageButton;
@property (nonatomic,strong) UIButton *pushvcButton;

@end

@implementation HomeView


-(void)addChildView{

    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.text = @"你好我是音乐君";
    [self addSubview:self.titleLabel];
    
    self.headImage = [[UIImageView alloc]init];
    self.headImage.image = [UIImage imageNamed:@"hanwei.jpg"];
    [self addSubview:self.headImage];
   
    self.changeImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.changeImageButton setTitle:@"点击改变头像" forState:UIControlStateNormal];
    [self.changeImageButton setTitleColor:purple_color forState:UIControlStateNormal];
    [self addSubview:self.changeImageButton];
    
    self.pushvcButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pushvcButton setTitle:@"Aspects ----AOPDemo" forState:UIControlStateNormal];
    [self.pushvcButton setTitleColor:purple_color forState:UIControlStateNormal];
    [self.pushvcButton setBackgroundColor:yellow_color];
    [self addSubview:self.pushvcButton];
    [self pushAopVC];
    [self changeImage];
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
}

-(void)updateConstraints{
    
    CGSize size = [self.titleLabel.text sizeWithAttributes:@{ NSFontAttributeName: self.titleLabel.font }];
    self.titleLabel.sd_layout.topSpaceToView(self,20).heightIs(size.height).widthIs(size.width).centerXEqualToView(self);
    self.headImage.sd_layout.topSpaceToView(self.titleLabel,10).heightIs(110).widthIs(110).centerXEqualToView(self);
    self.changeImageButton.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,100).widthIs(120).heightIs(30);
    self.pushvcButton.sd_layout.leftSpaceToView(self,15).topSpaceToView(self,180).widthIs(200).heightIs(30);
    [super updateConstraints];
}

-(void)changeImage{
    
    [[self.changeImageButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        static int i = 0;
        i++;
        if (i%2 == 0) {
            
            self.headImage.image = [UIImage imageNamed:@"hanwei.jpg"];
        }
        else{
            
            self.headImage.image = [UIImage imageNamed:@"music.jpg"];
            
        }
        
    }];
    
}
-(void)pushAopVC{
    
    [[self.pushvcButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        
        if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:)]) {
            [self.viewDelegate sa_view:self withEvents:@{@"pushAOP":@""}];
        }
        
    }];
    
}
@end
