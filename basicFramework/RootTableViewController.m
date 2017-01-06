//
//  RootTableViewController.m
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "RootTableViewController.h"

@interface RootTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildView];
}
-(void)addChildView{

    self.tableView = [[UITableView alloc] initWithFrame:(
                                                    self.tabFrame) style:(self.tableViewStyle)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.tableView];
    self.tableView.contentInset = UIEdgeInsetsZero;


}
-(void)leftButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger row = [self.rowArray[section] integerValue];
    return row;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionSum;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self rootTableView:tableView rootCellForRowAtIndexPath:indexPath];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return [self rootTableView:tableView heightForRowAtIndexPath:indexPath];
    
}
-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger heigth = [self.rowHeigthArray[indexPath.section] integerValue];
    
    return heigth;
    
}
-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"UITableViewCell"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat heigth = [self rootTableView:tableView rootHeightForFooterInSection:section];
    return heigth;
}
-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat heigth = [self rootTableView:tableView rootHForHeaderInSection:section];
    return heigth;
}
-(CGFloat)rootTableView:(UITableView *)tableView rootHForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [self rootTableView:tableView viewForFooterInSection:section];
}
-(UIView *)rootTableView:(UITableView *)rootTableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
-(UIView*)rootTableView:(UITableView *)rootTableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self rootTableView:tableView viewForHeaderInSection:section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self rootTableView:tableView didSelectRowAtIndexPath:indexPath];
}
-(void)rootTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
