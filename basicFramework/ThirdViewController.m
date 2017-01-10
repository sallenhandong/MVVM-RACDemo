//
//  ThirdViewController.m
//  basicFramework
//
//  Created by jefactoria on 17/1/10.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "ThirdViewController.h"
#import "RacWithKvoView.h"
@interface ThirdViewController ()
@property (nonatomic,strong) RacWithKvoView *kvoView;
@end

@implementation ThirdViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[self.params objectForKey:@"title"] isEqualToString:@"合并"]) {
        
        [self combineLatest];
    }
    [self monitorBakgroundColor];
}
-(void)addSubviews{

    self.kvoView = [[RacWithKvoView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 50, 200, 100, 100)];
    [self.kvoView.clickButton setTitle:[self.params objectForKey:@"title"] forState:UIControlStateNormal];
    [self.view addSubview:self.kvoView];

}
/**
 *  代替KVO  监听view背景颜色
 */
-(void)monitorBakgroundColor{
    [[self.kvoView.topView rac_valuesAndChangesForKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew observer:nil]subscribeNext:^(id x) {
        
        NSLog(@"view.background -change");
    
    }];

}
/**
 *  combineLatest  合并信号
 */
-(void)combineLatest{

    //将多个信号合并起来，并且拿到各个信号的最新的值,必须每个合并的signal至少都有过一次sendNext，才会触发合并的信号。
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id subscriber) {
        [subscriber sendNext:@"我想你"];
        [subscriber sendNext:@"我不想你"];
        [subscriber sendNext:@"Test"];
        return nil;
    }];
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id subscriber) {
        [subscriber sendNext:@"嗯"];
        [subscriber sendNext:@"你爱我"];
        return nil;
    }];
    
    [[self.kvoView.clickButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        
        //合并signalA和signalB
        [[RACSignal combineLatest:@[signalA, signalB]] subscribeNext:^(id x) {
            NSLog(@"%@",x);
        }];
        
    }];
    

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
