//
//  MANTheme.m
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/27.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import "MANTheme.h"

@implementation MANTheme

+(instancetype)initThemeWithDictionary:(NSDictionary *)dict{
    id obj = [[self alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
