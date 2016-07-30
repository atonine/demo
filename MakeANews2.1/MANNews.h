//
//  NewsTitle.h
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/22.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"MANGetDataTool.h"
@interface MANNews : NSObject

@property(nonatomic,copy)NSString*title;
@property(nonatomic,strong)NSArray*imagesArr;
@property(nonatomic,copy)NSString*NewsId;

+(void)newsListWithNewsId:(NSString*)ID getDataSucess:(GetDataSuccessBlock)sucess getFailure:(GetDataFailureBlock)failure;
+(NSArray*)cacheNewsArrayFromID:(NSString*)ID;
@end
