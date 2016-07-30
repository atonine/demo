//
//  NewsCell.m
//  MakeANews2.1
//
//  Created by 于洪志 on 16/7/22.
//  Copyright © 2016年 于洪志. All rights reserved.
//

#import "MANNewsCell.h"
#import "MANNews.h"
#import <UIImageView+WebCache.h>

@interface MANNewsCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *timageView;

@end

@implementation MANNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)setNewsCellWithTableView:(UITableView *)tableView news:(MANNews *)news{
    MANNewsCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MANNewsCell" owner:self options:nil]lastObject];
    }
    [cell.timageView sd_setImageWithURL:[news.imagesArr firstObject]completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        cell.titleLabel.text = news.title;
    }];
    return cell;

}
@end
