//
//  NewsTitle.m
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/22.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import "MANNews.h"



@implementation MANNews

+(instancetype)setNewsFromDict:(NSDictionary *)dict{
    MANNews*news = [[MANNews alloc]init];
    news.title = dict[@"title"];
    news.imagesArr = dict[@"images"];
    news.NewsId = dict[@"id"];
    return news;
}
+(void)newsListWithNewsId:(NSString*)ID getDataSucess:(GetDataSuccessBlock)sucess getFailure:(GetDataFailureBlock)failure{
    NSString*newsUrl = @"";
    if ([ID isEqualToString:@"1"]) {
        newsUrl =@"http://news-at.zhihu.com/api/4/news/latest";
    }
    else{
     newsUrl = @"http://news-at.zhihu.com/api/4/theme/";
     newsUrl = [NSString stringWithFormat:@"%@%@",newsUrl,ID];
    }

    [MANGetDataTool GETJSON:newsUrl progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary*dict = responseObject;
        NSArray*dicArr = dict[@"stories"];
        NSMutableArray*arrM = [NSMutableArray array];
        for (NSDictionary*dic in dicArr) {
            MANNews*news = [MANNews setNewsFromDict:dic];
            [arrM addObject:news];

        }

        NSString*filePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
        filePath = [filePath stringByAppendingFormat:@"/%@.plist",ID];
        NSLog(@"%@",filePath);
        [dicArr writeToFile:filePath atomically:NO];
        sucess(arrM.copy);
    } falure:^(NSURLSessionTask *task, NSError *error) {
        failure(error);
    }];

}

+(NSArray*)cacheNewsArrayFromID:(NSString*)ID{
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    filePath = [filePath stringByAppendingFormat:@"/%@.plist",ID];

    NSArray *dictArr = [NSArray arrayWithContentsOfFile:filePath];

    NSMutableArray *arrM = [NSMutableArray array];

    for (NSDictionary * dict in dictArr) {

        MANNews *news = [MANNews setNewsFromDict:dict];
        [arrM addObject:news];
    }

    return arrM;
}



@end
