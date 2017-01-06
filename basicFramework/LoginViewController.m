//
//  LoginViewController.m
//  sallenReactiveCocoa
//
//  Created by jefactoria on 16/12/28.
//  Copyright © 2016年 djmulder. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"
#import "HomeViewController.h"
@interface LoginViewController ()
@property(nonatomic,strong)LoginView *loginView;
@property(nonatomic,strong)LoginViewModel *viewModel;
@end

@implementation LoginViewController

-(LoginView *)loginView{

    if (!_loginView) {
        
        _loginView = [[LoginView alloc]init];
    }

    return _loginView;
}
-(LoginViewModel *)viewModel{
    
    if (!_viewModel) {
        
        _viewModel = [[LoginViewModel alloc]init];
    }
    
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    [self setUpLoginView];
    [self registLoginEvent];
    
}
-(void)setUpLoginView{

    self.loginView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.loginView];

}
//绑定与订阅
-(void)registLoginEvent{
    //RAC(TARGET, [KEYPATH, [NIL_VALUE]])：用于给某个对象的某个属性绑定
    RAC(self.viewModel, userName) = self.loginView.userNameTextfield.rac_textSignal;
    RAC(self.viewModel, password) = self.loginView.passWordTextfield.rac_textSignal;
    
    
    //rac_command：一般用来绑定button
    self.loginView.loginButton.rac_command = self.viewModel.loginCommand;
    
    //订阅RACCommand我们可以使用其内部的属性executionSignals返回一个信号，然后对这个信号进行订阅。
    
    //RACCommand中的executionSignals属性是一个包裹着信号的信号，
    
    [[self.viewModel.loginCommand executionSignals]
     subscribeNext:^(RACSignal *x) {
         //也可以在此处设置loading
         [x subscribeNext:^(NSString *x) {
         [MBProgressHUD hideHUDForView:nil animated:YES];
            NSLog(@"``````%@",x);
             if (x == nil) {
                 return;
             }
             
             [self performSelector:@selector(popHomeVC) withObject:self afterDelay:0.2];
          
         }];
     }];
    
    //也可以使用函数switchToLatest进行转换：
//    [[[self.viewModel.loginCommand executionSignals]switchToLatest]
//    subscribeNext:^(NSString *x) {
//        
//        [MBProgressHUD hideHUDForView:nil animated:YES];
//                 if (x == nil) {
//                     return;
//                 }
//    
//       [self performSelector:@selector(popHomeVC) withObject:self afterDelay:0.2];
//        
//        
//    }];
    
    //rac_textSignal：监听文本框文字改变
    //一般用于UITextField、UITextView
    
    @weakify(self);

    [self.loginView.userNameTextfield.rac_textSignal subscribeNext:^(NSString * x){
        
        static NSInteger const maxIntegerlength = 11;
        if (x.length) {
            if (x.length > 11) {
                @strongify(self);
                self.loginView.userNameTextfield.text = [self.loginView.userNameTextfield.text substringToIndex:maxIntegerlength];
            }
            
        }
    }];

    [self.loginView.passWordTextfield.rac_textSignal subscribeNext:^(NSString * x){
        
        static NSInteger const maxIntegerlength = 20;
        if (x.length) {
            if (x.length > 20) {
                @strongify(self);
                self.loginView.passWordTextfield.text = [self.loginView.passWordTextfield.text substringToIndex:maxIntegerlength];
            }
            
        }
    }];
    
}
-(void)popHomeVC{

    [self.navigationController popViewControllerAnimated:YES];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
