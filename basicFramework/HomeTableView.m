//
//  HomeTableView.m
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "HomeTableView.h"
#import "HomeTabViewViewModel.h"
#import "HomeTableViewCell.h"
@interface HomeTableView ()
@property (nonatomic,strong) NSArray *commonMethodArray;
@property (nonatomic,strong) NSArray *operateMethodArray;
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
        if (index.section == 0) {
            if (index.row == 0) {
                
                if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:)]) {
                    [self.viewDelegate sa_view:self withEvents:@{@"push":@"push"}];
                }
                
            }else if (index.row == 1){
                
                [self.viewModel.cellClickSubJect sendNext:@"你好"];
                
            }else if (index.row == 2) {
                
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
            
        }else{
        
        
        
        }
    
    }];
    
 
    self.frame = CGRectMake(0, 300, SCREEN_WIDTH, SCREEN_HEIGHT - 300);
    self.commonMethodArray = @[@"push viewController(viewManger)",
                               @"rac_textfield and Raccommand(RAC)",
                               @"rac_signalForSelector: (TableviewDelegate)",
                               @"rac_valuesAndChangesForKeyPath(KVO)",
                               @"rac_signal combineLatest"
                               ];
    self.operateMethodArray = @[@"flattenMap 根据前一个信号的参数创建一个新的信号！",
                                @"concat 组合 按一定顺序拼接信号，当多个信号发出的时候，有顺序的接收信号",
                                @"then 用于连接两个信号，当第一个信号完成，才会连接then返回的信号。",
                                @"merge 把多个信号合并为一个信号，任何一个信号有新值的时候就会调用",
                                @"zipWith 把两个信号压缩成一个信号，只有当两个信号同时发出信号内容时，并且把两个信号的内容合并成一个元组，才会触发压缩流的next事件。",
                                @"reduce 用于信号发出的内容是元组，把信号发出元组的值聚合成一个值",
                                @"filter 过滤信号，使用它可以获取满足条件的信号.",
                                @"ignore 忽略完某些值的信号.",
                                @"distinctUntilChanged",
                                @"take:从开始一共取N次的信号",
                                @"takeLast:取最后N次的信号,前提条件，订阅者必须调用完成，因为只有完成，就知道总共有多少信号.",
                                @"takeUntil:(RACSignal *):获取信号直到某个信号执行完成",
                                @"skip:(NSUInteger):跳过几个信号,不接受。",
                                @"switchToLatest:用于signalOfSignals（信号的信号），有时候信号也会发出信号，会在signalOfSignals中，获取signalOfSignals发送的最新信号。",
                                @"doNext: 执行Next之前，会先执行这个Block",
                                @"doCompleted: 执行sendCompleted之前，会先执行这个Block",
                                @"timeout：超时，可以让一个信号在一定的时间后，自动报错。",
                                @"interval 定时：每隔一段时间发出信号",
                                @"delay 延迟发送next",
                                @"retry重试 ：只要失败，就会重新执行创建信号中的block,直到成功.",
                                @"replay重放：当一个信号被多次订阅,反复播放内容",
                                @"throttle节流:当某个信号发送比较频繁时，可以使用节流，在某一段时间不发送信号内容，过了一段时间获取信号的最新内容发出。"
                                
                        ];
    self.tableView.bouncesZoom = NO;
    self.tableViewStyle = 0;
    self.tabFrame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
    self.sectionSum = 2;
    self.rowArray = [NSMutableArray arrayWithObjects:self.commonMethodArray,self.operateMethodArray, nil];
    self.rowHeigthArray = [NSMutableArray arrayWithArray:@[@"80",
                                                           @"80"]];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HomeTableviewCell"];
    [super setupViews];
}

-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierNormal = @"HomeTableviewCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
    if (!cell) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierNormal];
    }
    cell.titleLabel.text = self.rowArray[indexPath.section][indexPath.row];
    [cell cellAutoLayoutHeight:self.rowArray[indexPath.section][indexPath.row]];
    return cell;
}

-(CGFloat)rootTableView:(UITableView *)tableView rootHForHeaderInSection:(NSInteger)section{

    return 40;

}

-(UIView *)rootTableView:(UITableView *)rootTableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc]init];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 130, 40)];
    title.textColor = blue_color;
   ;
    [view addSubview:title];
    if (section == 0) {
        title.text = @"RAC--常用方法";
        title.backgroundColor = [UIColor colorWithHexString:@"3182D9" alpha:0.6];
        return view;
    }else{
        title.text = @"RAC--操作方法";
        title.backgroundColor = [UIColor colorWithHexString:@"C93F45" alpha:0.6];
        return view;
        
    }
    return nil;
}

//-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//
//    HomeTableViewCell *cell = (HomeTableViewCell *)[self rootTableView:self.tableView rootCellForRowAtIndexPath:indexPath];
//    
//    return cell.frame.size.height;
//}
@end
