//
//  LoginView.m
//  sallenReactiveCocoa
//
//  Created by jefactoria on 16/12/28.
//  Copyright © 2016年 djmulder. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()
@property(nonatomic,strong)UIImageView *backgroundImage;
@property(nonatomic,strong)UIImageView *inputBackGoundImage;
@property(nonatomic,strong)UIImageView *lineImage;
@property(nonatomic,strong)UIImageView *loginImage;
@property(nonatomic,strong)UIImageView *passwordImage;
@property(nonatomic,strong)UIButton *registButton;

@end
@implementation LoginView
-(UIImageView *)backgroundImage{
    if (!_backgroundImage) {
        
        _backgroundImage = [[UIImageView alloc]init];
        _backgroundImage.image = [UIImage imageNamed:@"登录背景.jpg"];
        
    }
    return _backgroundImage;

}
-(UIImageView *)inputBackGoundImage{
    if (!_inputBackGoundImage) {
        
        _inputBackGoundImage = [[UIImageView alloc]init];
        _inputBackGoundImage.image = [UIImage imageNamed:@"登录白背景"];
        _inputBackGoundImage.userInteractionEnabled = YES;
    }
    return _inputBackGoundImage;
    
}
-(UIImageView *)lineImage{
    if (!_lineImage) {
        
        _lineImage = [[UIImageView alloc]init];
        _lineImage.image = [UIImage imageNamed:@"登录分割线"];
    }
    return _lineImage;
    
}
-(UIImageView *)loginImage{
    if (!_loginImage) {
        
        _loginImage = [[UIImageView alloc]init];
        _loginImage.image = [UIImage imageNamed:@"登录账号图标"];
    }
    return _loginImage;
    
}
-(UIImageView *)passwordImage{
    if (!_passwordImage) {
        
        _passwordImage = [[UIImageView alloc]init];
        _passwordImage.image = [UIImage imageNamed:@"登录密码图标"];
    }
    return _passwordImage;
    
}
-(UIButton *)loginButton{

    if (!_loginButton) {
        
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"登录按钮"] forState:UIControlStateNormal];
    }
    return _loginButton;

}
-(UIButton *)registButton{
    
    if (!_registButton) {
        
        _registButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registButton setBackgroundImage:[UIImage imageNamed:@"注册按钮"] forState:UIControlStateNormal];
    }
    return _registButton;
    
}
-(UITextField *)userNameTextfield{
    
    if (!_userNameTextfield) {
 
        _userNameTextfield = [[UITextField alloc]init];
        _userNameTextfield.placeholder = @"请输入账号";
 
    }
    return _userNameTextfield;
    
}
-(UITextField *)passWordTextfield{
    
    if (!_passWordTextfield) {
        
        _passWordTextfield = [[UITextField alloc]init];
        _passWordTextfield.secureTextEntry = YES;
        _passWordTextfield.placeholder = @"请输入密码";
      
    }
    return _passWordTextfield;
    ;
    
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
    
  
    [self addSubview:self.backgroundImage];
    [self addSubview:self.inputBackGoundImage];
    [self addSubview:self.lineImage];
    [self.inputBackGoundImage addSubview:self.loginImage];
    [self.inputBackGoundImage addSubview:self.passwordImage];
    [self addSubview:self.loginButton];
    [self addSubview:self.registButton];
    [self.inputBackGoundImage addSubview:self.userNameTextfield];
    [self.inputBackGoundImage addSubview:self.passWordTextfield];
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
}

-(void)updateConstraints{

    self.backgroundImage.sd_layout.leftEqualToView(self).topEqualToView(self).rightEqualToView(self).bottomEqualToView(self);
    self.inputBackGoundImage.sd_layout.leftSpaceToView(self,50).topSpaceToView(self,200).widthIs(SCREEN_WIDTH - 100).heightIs(100);
    self.lineImage.sd_layout.leftEqualToView(self.inputBackGoundImage).centerYEqualToView(self.inputBackGoundImage).widthIs(self.inputBackGoundImage.width).heightIs(1);
    self.loginImage.sd_layout.leftSpaceToView(self.inputBackGoundImage,5).topSpaceToView(self.inputBackGoundImage,15).widthIs(18).heightIs(21);
    self.passwordImage.sd_layout.leftSpaceToView(self.inputBackGoundImage,5).topSpaceToView(self.loginImage,30).widthIs(18).heightIs(21);
    self.loginButton.sd_layout.topSpaceToView(self.inputBackGoundImage,80).leftEqualToView(self.inputBackGoundImage).widthIs(300).heightIs(43);
    self.registButton.sd_layout.topSpaceToView(self.loginButton,30).leftEqualToView(self.inputBackGoundImage).widthIs(300).heightIs(43);
    self.userNameTextfield.sd_layout.leftSpaceToView(self.loginImage,5).topSpaceToView(self.inputBackGoundImage,20).widthIs(self.inputBackGoundImage.width - 20).heightIs(20);
    self.passWordTextfield.sd_layout.leftSpaceToView(self.passwordImage,5).topSpaceToView(self.inputBackGoundImage,70).widthIs(self.inputBackGoundImage.width - 20).heightIs(20);
    [super updateConstraints];
}

@end
