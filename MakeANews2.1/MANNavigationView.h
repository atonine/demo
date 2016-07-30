//
//  MANNavigationView.h
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/27.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^itemClick)(NSInteger selectIndex);

@interface MANNavigationView : UIScrollView

@property(assign,nonatomic)NSInteger selectedItemIdex;

@property(strong,nonatomic)NSArray<NSString*>*items;
+(instancetype)navigationViewWithItems:(NSArray<NSString*>*)items itemClick:(itemClick)itemClick;

@end
