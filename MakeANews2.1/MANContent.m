//
//  MANContent.m
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/28.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import "MANContent.h"


///<link rel="stylesheet" href="http://news-at.zhihu.com/css/news_qa.auto.css?v=4b3e3">
@implementation MANContent

+(void)getHTMLStringWithID:(NSString *)ID successBlock:(void (^)(NSString *))success failure:(GetDataFailureBlock)failure{
    NSString*url = @"http://news-at.zhihu.com/api/4/news/";
    url = [NSString stringWithFormat:@"%@%@",url,ID];
    MANContent *content = [[MANContent alloc]init];
    [MANGetDataTool GETJSON:url progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSString*htmlString  = responseObject[@"body"];
        NSArray*cssSourceArray = responseObject[@"css"];
        NSString*cssString = [cssSourceArray firstObject];
        cssString = [NSString stringWithFormat:@"<link rel='stylesheet' href='%@'>",cssString];
        content.HTMLString = [NSString stringWithFormat:@"%@%@",htmlString,cssString];
        success(content.HTMLString);
    } falure:^(NSURLSessionTask *task, NSError *error) {
        failure(error);
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
