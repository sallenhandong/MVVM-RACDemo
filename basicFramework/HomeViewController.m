//
//  HomeViewController.m
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "HomeTableView.h"
#import "BaseRequest.h"
#import "HomeTabViewViewModel.h"
#import "LoginViewController.h"
#import "AspectCatModel.h"
@interface HomeViewController ()
@property(nonatomic,strong)HomeTableView *mainTab;
@property(nonatomic,strong)GAViewManager *viewManager;
@property(nonatomic,strong)HomeTabViewViewModel *viewModel;
@property(nonatomic,strong)HomeView *homeTopView;
@end

@implementation HomeViewController

- (GAViewManager *)viewManager {
    if (_viewManager == nil) {
        _viewManager = [[GAViewManager alloc]init];
    }
    return _viewManager;
}
- (HomeTabViewViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HomeTabViewViewModel alloc]init];
    }
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBar.hidden = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registEvent];
}

-(void)addSubviews{
    
   self.homeTopView = [[HomeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [self.view addSubview:self.homeTopView];
    

    self.mainTab = [[HomeTableView alloc]initWithViewModel:self.viewModel];
    [self.view addSubview:self.mainTab];
    
    
}

-(void)registEvent{

    [self.mainTab sa_viewWithViewManger:self.viewManager];
    [self.homeTopView sa_viewWithViewManger:self.viewManager];

}

-(void)bindViewModel{

    @weakify(self);
    [[self.viewModel.cellClickSubJect takeUntil:self.rac_willDeallocSignal ]subscribeNext:^(id x) {
     
        @strongify(self);
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:loginVC animated:YES];
       
    }];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
