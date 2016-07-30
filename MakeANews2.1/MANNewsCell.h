//
//  NewsCell.h
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/22.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MANNews;
@interface MANNewsCell : UITableViewCell

+(instancetype)setNewsCellWithTableView:(UITableView*)tableView news:(MANNews*)news;

@end
