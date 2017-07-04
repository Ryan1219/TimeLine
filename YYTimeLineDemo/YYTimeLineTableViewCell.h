//
//  YYTimeLineTableViewCell.h
//  YYTimeLineDemo
//
//  Created by Ryan on 2017/7/4.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYTimeLineModel.h"

@interface YYTimeLineTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/* <#description#> */
@property (nonatomic,strong) YYTimeLineModel *model;

@end
