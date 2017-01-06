//
//  SAViewManagerProtocol.h
//  SAMvvm
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ViewEventsBlock)( );
/**
 *  将自己的信息返回给ViewModel的block
 */
typedef void (^ViewModelInfosBlock)( );

/**
 *  将自己的信息返回给ViewManger的block
 */
typedef void (^ViewMangerInfosBlock)( );

@protocol SAViewManagerProtocol <NSObject>

@optional

- (void)sa_notice;

/**
 *  设置Controller的子视图的管理者为self
 *
 *  @param superView 一般指subView所在控制器的view
 */
- (void)sa_viewMangerWithSuperView:(UIView *)superView;

/**
 *  设置subView的管理者为self
 *
 *  @param subView 管理的subView
 */
- (void)sa_viewMangerWithSubView:(UIView *)subView;

/**
 *  设置添加subView的事件
 *
 *  @param subView 管理的subView
 *  @param info 附带信息，用于区分调用
 */
- (void)sa_viewMangerWithHandleOfSubView:(UIView *)subView info:(NSString *)info;

/**
 *  返回viewManger所管理的视图
 *
 *  @return viewManger所管理的视图
 */
- (__kindof UIView *)sa_viewMangerOfSubView;

/**
 *  得到其它viewManger所管理的subView，用于自己内部
 *
 *  @param viewInfos 其它的subViews
 */
- (void)sa_viewMangerWithOtherSubViews:(NSDictionary *)viewInfos;

/**
 *  需要重新布局subView时，更改subView的frame或者约束
 *
 *  @param updateBlock 更新布局完成的block
 */
- (void)sa_viewMangerWithLayoutSubViews:(void (^)( ))updateBlock;

/**
 *  使子视图更新到最新的布局约束或者frame
 */
- (void)sa_viewMangerWithUpdateLayoutSubViews;

/**
 *  将model数据传递给viewManger
 */
- (void)sa_viewMangerWithModel:(NSDictionary * (^) ( ))dictBlock;

/**
 *  处理viewBlock事件
 */
- (ViewEventsBlock)sa_viewMangerWithViewEventBlockOfInfos:(NSDictionary *)infos;

/**
 *  处理ViewModelInfosBlock
 */
- (ViewModelInfosBlock)sa_viewMangerWithViewModelBlockOfInfos:(NSDictionary *)infos;

/**
 *  处理ViewMangerInfosBlock
 */
- (ViewMangerInfosBlock)sa_viewMangerWithOtherViewMangerBlockOfInfos:(NSDictionary *)infos;

/**
 *  将viewManger中的信息通过代理传递给ViewModel
 *
 *  @param viewManger   viewManger自己
 *  @param infos 描述信息
 */
- (void)sa_viewManger:(id)viewManger withInfos:(NSDictionary *)infos;


@end
