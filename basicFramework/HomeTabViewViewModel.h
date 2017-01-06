//
//  HomeTabViewViewModel.h
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
@interface HomeTabViewViewModel :BaseViewModel
@property (nonatomic,strong) RACSubject *cellClickSubJect;
@property (nonatomic,strong) NSString *backgoundColor;
@property (nonatomic,strong) RACCommand *cellClickCommand;
@end
