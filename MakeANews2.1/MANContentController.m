//
//  MANContentController.m
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/28.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import "MANContentController.h"
#import "MANContent.h"
#import <MBProgressHUD.h>


@interface MANContentController ()

@property(nonatomic,strong)MANContent*content;

@property (weak, nonatomic) IBOutlet UIWebView *mWebView;

@end

@implementation MANContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.mWebView animated:YES];
    [MANContent getHTMLStringWithID:self.ID successBlock:^(NSString*content) {
        [MBProgressHUD hideHUDForView:self.mWebView animated:YES];
        [self.mWebView loadHTMLString:content baseURL:nil];
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.mWebView animated:YES];
        NSLog(@"%@",error);

    }];
    // Do any additional setup after loading the view.
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
