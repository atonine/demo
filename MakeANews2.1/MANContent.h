//
//  MANContent.h
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/28.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MANGetDataTool.h"
@interface MANContent : NSObject

@property(nonatomic,copy)NSString*ID;

@property(nonatomic,copy)NSString*HTMLString;


+(void)getHTMLStringWithID:(NSString*)ID successBlock:(void(^)(NSString*content))success failure:(GetDataFailureBlock)failure;

@end
