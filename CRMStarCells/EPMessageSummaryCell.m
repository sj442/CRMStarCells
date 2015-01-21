//
//  EPMessageSummaryCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.

#import "EPMessageSummaryCell.h"

@implementation EPMessageSummaryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.contentwidth = [[UIScreen mainScreen] bounds].size.width;
    UIView *dotView = [[UIView alloc]initWithFrame:CGRectMake(8, 21, 10, 10)];
    dotView.backgroundColor = [UIColor greenColor];
    dotView.layer.cornerRadius = 5;
    dotView.clipsToBounds = YES;
    [self.contentView addSubview:dotView];
    self.dotView = dotView;
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(25, 15, 150, 22)];
    name.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:name];
    self.nameLabel = name;
    UILabel *message = [[UILabel alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(self.nameLabel.frame)+4, self.contentwidth-40, 44)];
    message.font = [UIFont systemFontOfSize:12];
    message.numberOfLines = 2;
    message.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:message];
    self.messageLabel = message;
    UILabel *time = [[UILabel alloc]initWithFrame:CGRectMake(self.contentwidth-90, 10, 80, 13)];
    time.font = [UIFont systemFontOfSize:9];
    time.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:time];
    self.timeLabel = time;
  }
  return self;
}

- (void)configureWithName:(NSString *)name message:(NSString *)message time:(NSString *)time read:(BOOL)isRead
{
  self.nameLabel.text = name;
  self.messageLabel.text = message;
  [self.messageLabel sizeToFit];
  self.timeLabel.text = time;
  self.dotView.hidden = isRead;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
