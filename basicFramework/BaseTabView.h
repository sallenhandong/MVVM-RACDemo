//
//  BaseTabView.h
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
@interface BaseTabView : UIView<BaseViewProtocol>
@property(nonatomic, strong)UITableView *tableView;
/**表格行数数组*/
@property(nonatomic, strong)NSMutableArray *rowArray;
/**表格有多少区*/
@property(nonatomic, assign)NSInteger sectionSum;
/**row的高度*/
@property(nonatomic, strong)NSMutableArray *rowHeigthArray;
@property(nonatomic, assign)NSInteger tableViewStyle;
@property(nonatomic, assign)CGRect tabFrame;


-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForFooterInSection:(NSInteger)section;
-(CGFloat)rootTableView:(UITableView *)tableView rootHForHeaderInSection:(NSInteger)section;
-(UIView *)rootTableView:(UITableView *)rootTableView viewForFooterInSection:(NSInteger)section;
-(UIView*)rootTableView:(UITableView *)rootTableView viewForHeaderInSection:(NSInteger)section;

-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)rootTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
