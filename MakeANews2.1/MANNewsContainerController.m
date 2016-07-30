//
//  MANNewsContainerController.m
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/27.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import "MANNewsContainerController.h"
#import "MANNewsController.h"
#import "WSContainerController.h"
#import "MANTheme.h"

@interface MANNewsContainerController ()

@property(strong,nonatomic)NSArray*news;

@end

@implementation MANNewsContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray*vcs = [NSMutableArray arrayWithCapacity:self.news.count];
    for (MANTheme *theme in self.news) {
        MANNewsController*newsVC = [MANNewsController newsController];
        newsVC.newsID = theme.ID;
        newsVC.title = theme.name;
        [vcs addObject:newsVC];
    }
    WSContainerController*containVC = [WSContainerController containerControllerWithSubControlers:vcs parentController:self];
    containVC.navigationBarBackgrourdColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(NSArray*)news{

    if (!_news) {
        NSArray*newArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"News.plist" ofType:nil]];
        NSMutableArray*arrM = [NSMutableArray arrayWithCapacity:newArr.count];
        for (NSDictionary*dict in newArr) {
            MANTheme*theme = [MANTheme initThemeWithDictionary:dict];
            [arrM addObject:theme];
        }
        _news = arrM.copy;
    }
    return _news;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
