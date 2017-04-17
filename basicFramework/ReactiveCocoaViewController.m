//
//  ReactiveCocoaViewController.m
//  basicFramework
//
//  Created by jefactoria on 17/3/30.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "ReactiveCocoaViewController.h"
#import "HomeTableView.h"
#import "HomeTabViewViewModel.h"
#import "LoginViewController.h"
@interface ReactiveCocoaViewController ()
@property(nonatomic,strong)HomeTableView *mainTab;
@property(nonatomic,strong)HomeTabViewViewModel *viewModel;
@property(nonatomic,strong)GAViewManager *viewManager;
@end

@implementation ReactiveCocoaViewController
- (HomeTabViewViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HomeTabViewViewModel alloc]init];
    }
    return _viewModel;
}
- (GAViewManager *)viewManager {
    if (_viewManager == nil) {
        _viewManager = [[GAViewManager alloc]init];
    }
    return _viewManager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registEvent];
    

}
-(void)addSubviews{
    
    self.mainTab = [[HomeTableView alloc]initWithViewModel:self.viewModel];
    [self.view addSubview:self.mainTab];
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(20, 30, 50, 50);
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:red_color forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(actionWithBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}
-(void)actionWithBack{

    [self.navigationController popViewControllerAnimated:YES];

}

-(void)bindViewModel{
    
    @weakify(self);
    [[self.viewModel.cellClickSubJect takeUntil:self.rac_willDeallocSignal ]subscribeNext:^(id x) {
        
        @strongify(self);
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:loginVC animated:YES];
        
    }];
    
    
}
-(void)registEvent{
    
    [self.mainTab sa_viewWithViewManger:self.viewManager];
    
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
