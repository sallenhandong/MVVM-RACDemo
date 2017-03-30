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
@property (nonatomic,strong) UIButton *promiseButton;
@property (nonatomic,strong) UIButton *racButton;
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
    [self.changeImageButton setTitleColor:white_color forState:UIControlStateNormal];
    [self.changeImageButton setBackgroundColor:[UIColor colorWithHexString:@"3182D9"]];
    [self addSubview:self.changeImageButton];
    
    self.pushvcButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pushvcButton setTitle:@"Aspects-AOP" forState:UIControlStateNormal];
    [self.pushvcButton setTitleColor:white_color forState:UIControlStateNormal];
    [self.pushvcButton setBackgroundColor:[UIColor colorWithHexString:@"C93F45"]];
    [self addSubview:self.pushvcButton];
    
    
    
    self.racButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.racButton setTitle:@"ReactiveCocoa" forState:UIControlStateNormal];
    [self.racButton setTitleColor:white_color forState:UIControlStateNormal];
    [self.racButton setBackgroundColor:[UIColor colorWithHexString:@"3182D9"]];
    [self addSubview:self.racButton];
    
    
    
    self.promiseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.promiseButton setTitle:@"Promise" forState:UIControlStateNormal];
    [self.promiseButton setTitleColor:white_color forState:UIControlStateNormal];
    [self.promiseButton setBackgroundColor:[UIColor colorWithHexString:@"C93F45"]];
    [self addSubview:self.promiseButton];
    
    
    
    
    
    [self pushAopVC];
    [self pushReactiveVC];
    [self changeImage];
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
}

-(void)updateConstraints{
    
    CGSize size = [self.titleLabel.text sizeWithAttributes:@{ NSFontAttributeName: self.titleLabel.font }];
    self.titleLabel.sd_layout.topSpaceToView(self,30).heightIs(size.height).widthIs(size.width).centerXEqualToView(self);
    self.headImage.sd_layout.topSpaceToView(self,64).heightIs(150).widthIs(200).centerXEqualToView(self);
    self.changeImageButton.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,230).widthIs(SCREEN_WIDTH/2 - 10).heightIs(50);
    self.pushvcButton.sd_layout.leftSpaceToView(self.changeImageButton,0).topSpaceToView(self,230).widthIs(SCREEN_WIDTH/2 - 10).heightIs(50);
    self.racButton.sd_layout.leftSpaceToView(self,10).topSpaceToView(self,300).widthIs(SCREEN_WIDTH/2 - 10).heightIs(50);
    
     self.promiseButton.sd_layout.leftSpaceToView(self.changeImageButton,0).topSpaceToView(self,300).widthIs(SCREEN_WIDTH/2 - 10).heightIs(50);
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
        
        if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:url:)]) {
            [self.viewDelegate sa_view:self withEvents:nil url:AopViewControllerUrl];
        }
        
    }];
    
}
-(void)pushReactiveVC{

    [[self.racButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        
        if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:url:)]) {
            [self.viewDelegate sa_view:self withEvents:nil url:ReactiveCocoaViewControllerUrl];
        }
        
    }];

}
@end
