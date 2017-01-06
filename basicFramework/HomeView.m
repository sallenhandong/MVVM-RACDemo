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
    [self changeImage];
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
}

-(void)updateConstraints{
    
    CGSize size = [self.titleLabel.text sizeWithAttributes:@{ NSFontAttributeName: self.titleLabel.font }];
    self.titleLabel.sd_layout.topSpaceToView(self,20).heightIs(size.height).widthIs(size.width).centerXEqualToView(self);
    self.headImage.sd_layout.topSpaceToView(self.titleLabel,10).heightIs(110).widthIs(110).centerXEqualToView(self);
    self.changeImageButton.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,100).widthIs(120).heightIs(30);
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

@end
