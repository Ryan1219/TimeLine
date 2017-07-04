//
//  ViewController.m
//  YYTimeLineDemo
//
//  Created by Ryan on 2017/7/4.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "ViewController.h"
#import "YYTimeLineTableViewCell.h"
#import "YYTimeLineModel.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//MARK:----颜色----
#define YYColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/* <#description#> */
@property (nonatomic,strong) UITableView *tableView;
/* <#description#> */
@property (nonatomic,strong) NSMutableArray *titleArr;
/* <#description#> */
@property (nonatomic,strong) NSMutableArray *dataArr;

@end


@implementation ViewController


/* <#description#> */
- (NSMutableArray *)titleArr {
    if (_titleArr == nil) {
        _titleArr = [NSMutableArray arrayWithObjects:@"you know ,this is timeline(时间轴)!",@"灵感来源于：美团的订单详情页面 和 path软件",@"这只是个简单的实现，当然，你可以做的更丰富，左侧加头像或者其他...",@"初衷：工作项目需要，该死的老板一次次的改想法,当然，也要感谢他逼着成长",@"实现：感谢一个叫：Cyandev的作者，他的文章是我实现的源泉",@"我喜欢开源，对于一个正在成长的编程者，它帮助我太多了",@"这个时间轴分享给大家，贡献不论大小，也是一种贡献吧",@"再次感谢！！！！",@"(^_^)^_^^ - ^……(^_^)v，表情冲一下数", nil];
    }
    
    return _titleArr;
}

/* <#description#> */
- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self configData];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = YYColor(0xeeeeee);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = [self tableHeadView];
    self.tableView.tableFooterView = [self tabelFootView];
    [self.view addSubview:self.tableView];
}

- (UIView *)tableHeadView {
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    headView.backgroundColor = [UIColor redColor];
    
    return headView;
}

- (UIView *)tabelFootView {
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 80)];
    footView.backgroundColor = YYColor(0xeeeeee);
    
    
    UILabel *endLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 42, 60, 18)];
    endLabel.textColor = YYColor(0x999999);
    endLabel.text = @" end      -";
    endLabel.textAlignment = NSTextAlignmentCenter;
    endLabel.numberOfLines = 0;
    endLabel.font = [UIFont systemFontOfSize:14];
    [footView addSubview:endLabel];
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(80, 0, 1, 44)];
    lineView.backgroundColor = [UIColor yellowColor];
    [footView addSubview:lineView];
    
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(72, 44, 16, 16)];
    grayView.layer.cornerRadius = 8;
    grayView.layer.masksToBounds = true;
    grayView.backgroundColor = [UIColor yellowColor];
    [footView addSubview:grayView];
    
    return footView;
}


- (void)configData {
    
    for (int i = 0; i < self.titleArr.count; i++) {
        
        YYTimeLineModel *model = [[YYTimeLineModel alloc] init];
        model.comment = self.titleArr[i];
        model.date = @"7月\n2017";
        model.imageurl = @"";
        [self.dataArr addObject:model];
    }
}

//MARK:- TableView Delegate & DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YYTimeLineTableViewCell *cell = [YYTimeLineTableViewCell cellWithTableView:tableView];
    cell.model = self.dataArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return  (ScreenWidth - 110) + 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}


@end




























































