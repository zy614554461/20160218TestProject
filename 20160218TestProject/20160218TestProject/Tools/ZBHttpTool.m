//
//  ZBHttpTool.m
//  banyou
//
//  Created by Zimbee on 15/8/25.
//  Copyright (c) 2015年 xiexiangqing. All rights reserved.
//
#import "ZBHttpTool.h"
@implementation ZBHttpTool
+ (void)GET:(NSString *)url parameters:(id)param success:(void (^)(id resposeObject))success
    failure:(void (^)(NSError * error))failure{
//创建请求管理者
    AFHTTPRequestOperationManager *mgr=[[AFHTTPRequestOperationManager alloc]init];
    [mgr GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
+ (void)POST:(NSString *)url parameters:(id)param success:(void (^)(id resposeObject))success
     failure:(void (^)(NSError * error))failure{
    AFHTTPRequestOperationManager *mgr=[[AFHTTPRequestOperationManager alloc]init];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    [mgr POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+ ( AFHTTPRequestOperationManager *)POST:(NSString *)url parameter:(id)param success:(void (^)(id resposeObject))success failure:(void (^)(NSError * error))failure{
    AFHTTPRequestOperationManager *manager=[[AFHTTPRequestOperationManager alloc]init];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    [manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return manager;
}


@end
