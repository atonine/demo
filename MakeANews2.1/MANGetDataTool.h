//
//  MANGetDataTool.h
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/22.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^progressBlock) (NSProgress*downloadProgress);
typedef void(^successBlock) (NSURLSessionTask* task,id responseObject);
typedef void(^failureBlock) (NSURLSessionTask*task,NSError*error);
typedef void(^GetDataSuccessBlock)(NSArray*dataArray) ;
typedef void(^GetDataFailureBlock) (NSError*error);


@interface MANGetDataTool : AFHTTPSessionManager
+(NSURLSessionTask*)GETJSON:(NSString*)urlStr progress:(progressBlock)progress success:(successBlock)sucess falure:(failureBlock)failure;
@end
