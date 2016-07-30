//
//  MANNewsController.m
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/22.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import "MANNewsController.h"
#import "MANNews.h"
#import "MANNewsCell.h"
#import "MANGetDataTool.h"
#import <UIView+MJExtension.h>
#import <MJRefresh.h>
#import "MANContentController.h"
@interface MANNewsController ()<UITableViewDelegate,UITableViewDataSource>
{



    NSMutableArray*_newsArray;
}
//@property(weak,nonatomic)UITableView*mytableView;
@property(strong,nonatomic)NSMutableArray*newsArray;

@property (weak, nonatomic) IBOutlet UITableView *mTableView;


@end

@implementation MANNewsController//-(NSMutableArray *)newsArr{
//    if (_newsArr==nil) {
//        MANGetDataTool GETJSON:@"http://news-at.zhihu.com/api/4/news/latest" progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//            NSArray*dictArr = responseObject[@"stories"];
//        } falure:^(NSURLSessionTask *task, NSError *error) {
//
//        }
//      //  NSMutableArray*newsArr=[NSMutableArray array];
//
//    }
//    return nil

//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 84.0;
}

- (void)viewDidLoad {
     [super viewDidLoad];
   // self.tableView.sectionHeaderHeight = 80.0;
    [self setRefresh];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(NSMutableArray *)newsArray{

    if (!_newsArray) {
        NSArray*arr = [MANNews cacheNewsArrayFromID:self.newsID];
        _newsArray  = [NSMutableArray arrayWithArray:arr];
    }

    return _newsArray;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -刷新数据
-(void)setRefresh{
    typeof(self) __weak weakSelf = self;

    self.mTableView.mj_header =[MJRefreshStateHeader headerWithRefreshingBlock:^{
        [MANNews newsListWithNewsId:self.newsID getDataSucess:^(NSArray *dataArray) {
            if (self.newsArray.count>0) {
                [self.newsArray removeAllObjects];
            }
            [weakSelf.newsArray addObjectsFromArray:dataArray];
            [self.mTableView reloadData];
        } getFailure:^(NSError *error) {
            
        }];

    }];



    [self.mTableView.mj_header beginRefreshingWithCompletionBlock:^{
        [self.mTableView.mj_header endRefreshing];
    }];


}
-(void)reloadData{

}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArray.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MANNewsCell *cell = [MANNewsCell setNewsCellWithTableView:tableView news:self.newsArray[indexPath.row]];

    
    // Configure the cell...
    
    return cell;
}
+ (instancetype)newsController{

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    MANNewsController *newsVC = [sb instantiateViewControllerWithIdentifier:@"newsController"];


    return newsVC;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MANNews*news = self.newsArray[indexPath.row];

 //   vc.ID = news.NewsId;
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MANContentController" bundle:nil];

    MANContentController *contentVC = [sb instantiateViewControllerWithIdentifier:@"contentController"];
    contentVC.ID = news.NewsId;
    [self.navigationController pushViewController:contentVC animated:YES];
    

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
