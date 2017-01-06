//
//  BaseRequest.m
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

- (instancetype)init{
    return [self initWithToken];
}

- (instancetype)initWithToken{
    NSURL * url = [NSURL URLWithString:urlHead];
    if (self = [super initWithBaseURL:url]) {
        
        NSString *str = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
        
        [self produceHTTPSign:str];
    }
   return self;
}
/**
 *  生成一个API访问签名
 */
- (void)produceHTTPSign:(NSString *)token{
    
//根据需求设置
}
- (void)postRequest:(NSString *)url
             params:(NSDictionary *)paramDic
            Success:(void(^)(id responseData))success
            failure:(void(^)(NSError *error))failure
        showLoading:(bool) showLoading
        showMessage:(NSString *) message{
    
    [self postRequest:url params:paramDic Success:^(id responseData) {
        if(success){
            success(responseData);
        }
    } responseFailure:nil failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    } showLoading:showLoading showMessage:message];
}

- (void)postRequest:(NSString *)url
             params:(NSDictionary *)paramDic
            Success:(void(^)(id responseData))success
    responseFailure:(void(^)())responseFailure
            failure:(void(^)(NSError *error))failure
        showLoading:(bool) showLoading
        showMessage:(NSString *) message{
    
    if(![Utility checkNetWorkAvailable]){
        return;
    }
    
    if(showLoading && (message == nil || [message isEqualToString:@""])){
        message = @"加载中";
    }
    
    if(showLoading){
        [MBProgressHUD showMessag:message toView:nil];
    }
    
    [self POST:url
    parameters:paramDic
      progress:nil
       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
           NSLog(@"~~~%@", responseObject);
           
           [MBProgressHUD hideHUDForView:nil animated:YES];
           if ([responseObject[@"IsSuccess"] integerValue] == 1) {
               if (success) {
                   success(responseObject[@"Data"]);
               }
           }else{
   
                    success(responseObject[@"Data"]);
           }
           
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

           
           if (failure) {
               failure(error);
           }
       }];
}

@end
