//
//  HomeTableView.m
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "HomeTableView.h"
#import "HomeTabViewViewModel.h"
@interface HomeTableView ()
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) HomeTabViewViewModel *viewModel;
@end

@implementation HomeTableView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{

    self.viewModel = (HomeTabViewViewModel *)viewModel;
    return [super initWithViewModel:viewModel];

}

-(void)setupViews{
  
    /**
     *  RAC代替tableViewdidselect  代理需要最后设置 否则信号无法订阅到
     */
    [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)]subscribeNext:^(RACTuple * x) {
        NSIndexPath *index = x.second;
        if (index.row == 2) {
            
            LXAlertView *alert=[[LXAlertView alloc] initWithTitle:@"提示" message:@"这是一个弹框" cancelBtnTitle:@"取消" otherBtnTitle:@"确定" clickIndexBlock:^(NSInteger clickIndex) {
                
            }];
            [alert showLXAlertView];
            
        }else if (index.row == 3){
        
            if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:)]) {
                [self.viewDelegate sa_view:self withEvents:@{@"pushThird":@"kvo"}];
            }
        }else if (index.row == 4){
            
            if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:)]) {
                [self.viewDelegate sa_view:self withEvents:@{@"pushThird":@"combine"}];
            }
        }
     
    }];
    
 
    self.frame = CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HEIGHT - 200);
    self.titleArray = @[@"push viewController(viewManger)",
                        @"rac_textfield and Raccommand(RAC)",
                        @"rac_signalForSelector: (TableviewDelegate)",
                        @"rac_valuesAndChangesForKeyPath(KVO)",
                        @"rac_signal combineLatest"
                        ];

    self.tableView.bouncesZoom = NO;
    self.tableViewStyle = 0;
    self.tabFrame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
    self.sectionSum = 1;
    self.rowArray = [NSMutableArray arrayWithArray: self.titleArray];
    self.rowHeigthArray = [NSMutableArray arrayWithArray:@[@"80"]];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HomeTableviewCell"];
    [super setupViews];
}

-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableviewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"HomeTableviewCell"];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.textLabel.textColor = purple_color;
    return cell;
}
-(void)rootTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:)]) {
            [self.viewDelegate sa_view:self withEvents:@{@"push":@"push"}];
        }
        
    }else if (indexPath.row == 1){
      
        [self.viewModel.cellClickSubJect sendNext:@"你好"];
  
    }else if (indexPath.row == 2){
    
    
    
    
    
    }
    
  
}




@end
