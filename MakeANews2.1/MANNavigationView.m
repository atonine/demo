//
//  MANNavigationView.m
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/27.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import "MANNavigationView.h"

#define kViewH 35
#define kItemW 70
#define kMargin 10

@interface MANNavigationView ()

@property(strong,nonatomic)NSMutableArray*btns;

@property(weak,nonatomic)UIButton*selectedItem;

@property(copy,nonatomic)itemClick itemClickClock;


@end

@implementation MANNavigationView

-(void)itemClick:(UIButton*)sender{
    if ([sender isEqual:self.selectedItem]) {
        return;

    }
    self.selectedItem.selected = NO;
    sender.selected = YES;
    [UIView animateWithDuration:0.5 animations:^{
        sender.titleLabel.font = [UIFont systemFontOfSize:13];
    }];


    CGFloat offsetX = sender.center.x - self.center.x;
    if (offsetX<0) {
        self.contentOffset = CGPointZero;
    }else if (offsetX>(self.contentSize.width - self.bounds.size.width)){
        self.contentOffset = CGPointMake(self.contentSize.width - self.bounds.size.width, 0);
    }
    else{
        self.contentOffset = CGPointMake(offsetX, 0);
    }
    self.selectedItem = sender;
}
-(void)setSelectedItemIdex:(NSInteger)selectedItemIdex{
    _selectedItemIdex = selectedItemIdex;
    UIButton*item = self.btns[selectedItemIdex];
    [self itemClick:item];
}

-(void)setContentOffset:(CGPoint)contentOffset{
    [UIView animateWithDuration:0.5 animations:^{
        [super setContentOffset:contentOffset];

    }];

}
#pragma mark - init
+(instancetype)navigationViewWithItems:(NSArray<NSString *> *)items itemClick:(itemClick)itemClick{
    MANNavigationView*nav = [[MANNavigationView alloc]init];
    nav.itemClickClock = itemClick;
    nav.items = items;
    nav.scrollsToTop = NO;
    return nav;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews{
    [super layoutSubviews];
    for (NSInteger i = 0; i<self.btns.count; i++) {
        UIButton*item = self.btns[i];
        CGFloat itemX = kMargin+kItemW*i;
        item.frame = CGRectMake(itemX, 0, kItemW, kViewH);
    }
    self.contentSize = CGSizeMake(kViewH*self.btns.count+kMargin*2, kViewH);
}

-(void)setItems:(NSArray<NSString *> *)items{
    _items = items;
    for (NSInteger i = 0; i<items.count; i++) {
        UIButton*item = [[UIButton alloc]init];
        [item setTitle:items[i] forState:UIControlStateNormal];
        [item setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        item.titleLabel.font = [UIFont systemFontOfSize:13];
        item.titleLabel.textAlignment =NSTextAlignmentCenter;
        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.btns addObject:item];
        [self addSubview:item];
        item.tag  = i;
    }
}
-(void)setFrame:(CGRect)frame{
    frame.size.height = kViewH;
    [super setFrame:frame];
}
-(instancetype)init{
    if (self=[super init]) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;

    }
    return self;
}
@end
