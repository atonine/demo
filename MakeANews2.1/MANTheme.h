//
//  MANTheme.h
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/27.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MANTheme : NSObject

@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*ID;


+(instancetype)initThemeWithDictionary:(NSDictionary*)dict;


@end
