//
//  YYTimeLineTableViewCell.m
//  YYTimeLineDemo
//
//  Created by Ryan on 2017/7/4.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "YYTimeLineTableViewCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.heightr
//MARK:----颜色----
#define YYColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface YYTimeLineTableViewCell ()

/* <#description#> */
@property (nonatomic,strong) UILabel *dataLabel;
/* <#description#> */
@property (nonatomic,strong) UIView *topLine;
/* <#description#> */
@property (nonatomic,strong) UIView *bottomLine;
/* <#description#> */
@property (nonatomic,strong) UIImageView *smallImageView;
/* <#description#> */
@property (nonatomic,strong) UIImageView *commentImageView;
/* <#description#> */
@property (nonatomic,strong) UILabel *commentLabel;
/* <#description#> */
@property (nonatomic,strong) UIButton *zanBtn;
/* <#description#> */
@property (nonatomic,strong) UIButton *commentBtn;

@end

@implementation YYTimeLineTableViewCell



+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *TimeLineTableViewCellIndentifier = @"TimeLineTableViewCellIndentifier";
    YYTimeLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TimeLineTableViewCellIndentifier];
    if (cell == nil) {
        cell = [[YYTimeLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TimeLineTableViewCellIndentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = YYColor(0xeeeeee);
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self configLayout];
    }
    return self;
}

- (void)configLayout {
    
    CGFloat imageW = ScreenWidth - 110;
    CGFloat height = imageW + 120;
    
    self.dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    self.dataLabel.textColor = YYColor(0x999999);
    self.dataLabel.textAlignment = NSTextAlignmentCenter;
    self.dataLabel.numberOfLines = 0;
    self.dataLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.dataLabel];
    
    
    self.topLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dataLabel.frame)+20, 0, 1, 40)];
    self.topLine.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.topLine];
    
    self.smallImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dataLabel.frame)+12, CGRectGetMaxY(self.topLine.frame), 16, 16)];
    self.smallImageView.image = [UIImage imageNamed:@"comment"];
    [self.contentView addSubview:self.smallImageView];
    
    self.bottomLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dataLabel.frame)+20, CGRectGetMaxY(self.smallImageView.frame), 1, height - CGRectGetMaxY(self.smallImageView.frame))];
    self.bottomLine.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.bottomLine];
    
    
    self.commentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.smallImageView.frame)+12, 10, imageW, imageW)];
    self.commentImageView.backgroundColor = [UIColor redColor];
    self.commentImageView.userInteractionEnabled = true;
    [self.contentView addSubview:self.commentImageView];
    
    
    self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.smallImageView.frame)+12, CGRectGetMaxY(self.commentImageView.frame), imageW, 60)];
    self.commentLabel.textAlignment = NSTextAlignmentCenter;
    self.commentLabel.textColor = YYColor(0x666666);
    self.commentLabel.numberOfLines = 0;
    self.commentLabel.backgroundColor = [UIColor whiteColor];
    self.commentLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.commentLabel];
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.smallImageView.frame)+12, CGRectGetMaxY(self.commentLabel.frame)-0.5, imageW, 0.5)];
    lineView.backgroundColor = YYColor(0xcccccc);
    [self.contentView addSubview:lineView];
    
    
    self.zanBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.smallImageView.frame)+12, CGRectGetMaxY(self.commentLabel.frame), imageW/2, 40)];
    [self.zanBtn setTitle:@"0" forState:UIControlStateNormal];
    [self.zanBtn setTitleColor:YYColor(0x999999) forState:UIControlStateNormal];
    self.zanBtn.backgroundColor = [UIColor whiteColor];
    [self.zanBtn addTarget:self action:@selector(clickZanBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.zanBtn];
    
    
    self.commentBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.zanBtn.frame), CGRectGetMaxY(self.commentLabel.frame), imageW/2, 40)];
    [self.commentBtn setTitle:@"0" forState:UIControlStateNormal];
    [self.commentBtn setTitleColor:YYColor(0x999999) forState:UIControlStateNormal];
    self.commentBtn.backgroundColor = [UIColor whiteColor];
    [self.commentBtn addTarget:self action:@selector(clickCommentBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.commentBtn];
    
    
}


- (void)setModel:(YYTimeLineModel *)model {
    
    _model = model;
    
    self.dataLabel.text = model.date;
    self.commentLabel.text = model.comment;
}


- (void)clickZanBtnAction:(UIButton *)sender {
    
    
}


- (void)clickCommentBtnAction:(UIButton *)sender {
    
    
}









- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
