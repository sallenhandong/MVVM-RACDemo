//
//  AOPViewController.m
//  basicFramework
//
//  Created by jefactoria on 17/1/12.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "AOPViewController.h"
#import "AopView.h"
#import "AspectCatModel.h"
@interface AOPViewController ()

@end

@implementation AOPViewController
-(void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"AOP";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildView];
    [self initAspect];
}

-(void)addChildView{
    AopView *view = [[AopView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:view];
}


/*Aspects实现类方法拦截*/
-(void)initAspect{
    
    Class catMetal = objc_getMetaClass(NSStringFromClass(AspectCatModel.class).UTF8String);
    
    [catMetal aspect_hookSelector:@selector(classFee) withOptions:AspectPositionAfter usingBlock:^{
        
        NSLog(@"aspectFee");
        
    } error:NULL];
    
    [AspectCatModel classFee];
    
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
