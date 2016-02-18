//
//  ZBHttpTool.h
//  banyou
//
//  Created by Zimbee on 15/8/25.
//  Copyright (c) 2015年 xiexiangqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class ZBUploadParam;
@interface ZBHttpTool : NSObject
/**
 *发送get请求
 */
+ (void)GET:(NSString *)url parameters:(id)param success:(void (^)(id resposeObject))success
         failure:(void (^)(NSError * error))failure;
/**
 *  发送post请求
 *
 *  @param url     请求的URL
 *  @param param   请求的参数字典
 *  @param sucess  请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)POST:(NSString *)url parameters:(id)param success:(void (^)(id resposeObject))success
     failure:(void (^)(NSError * error))failure;


+ (AFHTTPRequestOperationManager *)POST:(NSString *)url parameter:(id)param success:(void (^)(id resposeObject))success failure:(void (^)(NSError * error))failure;



@end
