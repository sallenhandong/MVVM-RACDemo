//
//  HomeViewController.m
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "BaseRequest.h"

@interface HomeViewController ()

@property(nonatomic,strong)GAViewManager *viewManager;

@property(nonatomic,strong)HomeView *homeTopView;
@end

@implementation HomeViewController

- (GAViewManager *)viewManager {
    if (_viewManager == nil) {
        _viewManager = [[GAViewManager alloc]init];
    }
    return _viewManager;
}

-(void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBar.hidden = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registEvent];
    
}

-(void)addSubviews{
    
    self.homeTopView = [[HomeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 500)];
    [self.view addSubview:self.homeTopView];
    
}

-(void)registEvent{


    [self.homeTopView sa_viewWithViewManger:self.viewManager];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
