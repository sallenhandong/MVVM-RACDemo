//
//  BaseTabView.m
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "BaseTabView.h"

@interface BaseTabView ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation BaseTabView
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    
    self = [super init];
    if (self) {
        
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}
- (void)setupViews {
    
    self.tableView = [[UITableView alloc] initWithFrame:(
                                                         self.tabFrame) style:(self.tableViewStyle)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self addSubview:self.tableView];
    self.tableView.contentInset = UIEdgeInsetsZero;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger row = [self.rowArray[section] count];
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

-(void)bindViewModel{

}


@end
