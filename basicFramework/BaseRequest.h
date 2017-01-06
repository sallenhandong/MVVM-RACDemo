//
//  BaseRequest.h
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "MBProgressHUD+Add.h"
@interface BaseRequest : AFHTTPSessionManager
/**添加构造方法*/
- (instancetype)initWithToken;

- (void)postRequest:(NSString *)url
             params:(NSDictionary *)paramDic
            Success:(void(^)(id responseData))success
            failure:(void(^)(NSError *error))failure
        showLoading:(bool) showLoading
        showMessage:(NSString *) message;

@end
