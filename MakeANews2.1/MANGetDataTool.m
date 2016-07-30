//
//  MANGetDataTool.m
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/22.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import "MANGetDataTool.h"

@implementation MANGetDataTool
static id _instance;
+(NSURLSessionTask *)GETJSON:(NSString *)urlStr progress:(progressBlock)progress success:(successBlock)sucess falure:(failureBlock)failure{
    MANGetDataTool*tool = [self shareGetDataTool];
    AFJSONResponseSerializer*response = [AFJSONResponseSerializer serializer];
    NSSet* set=[NSSet setWithArray:@[@"text/html",@"application/json",@"*/*"]];
    response.acceptableContentTypes = set;
    tool.responseSerializer = response;


    return [tool GET:urlStr parameters:nil progress:progress success:sucess failure:failure];
}
+(instancetype)shareGetDataTool{
  //  static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}
@end
