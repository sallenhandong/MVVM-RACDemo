//
//  RootTableViewController.h
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewController : UIViewController
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *rowArray;
@property(nonatomic, assign)NSInteger sectionSum;
@property(nonatomic, strong)NSMutableArray *rowHeigthArray;
@property(nonatomic, assign)NSInteger tableViewStyle;
@property(nonatomic, assign)CGRect tabFrame;


-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForFooterInSection:(NSInteger)section;
-(CGFloat)rootTableView:(UITableView *)tableView rootHForHeaderInSection:(NSInteger)section;
-(UIView *)rootTableView:(UITableView *)rootTableView viewForFooterInSection:(NSInteger)section;
-(UIView*)rootTableView:(UITableView *)rootTableView viewForHeaderInSection:(NSInteger)section;

-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)addChildView;

-(void)rootTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
