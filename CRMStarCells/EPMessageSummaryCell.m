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
    
    [self setupDotView];
    
    [self setupNameLabel];
    
    [self setupMessageLabel];
    
    [self setupTimeLabel];
  }
  return self;
}

- (void)setupDotView
{
  UIView *dotView = [UIView new];
  [self.contentView addSubview:dotView];
  self.dotView = dotView;

  dotView.backgroundColor = [UIColor greenColor];
  dotView.layer.cornerRadius = 5;
  dotView.clipsToBounds = YES;
  
  CGRect frame = CGRectZero;
  frame.origin.x = 8;
  frame.origin.y = 21;
  frame.size.width = 10;
  frame.size.height = 10;
  self.dotView.frame = frame;
 }

- (void)setupNameLabel
{
  UILabel *name = [UILabel new];
  [self.contentView addSubview:name];
  self.nameLabel = name;
  
  name.font = [UIFont systemFontOfSize:18];
  
  CGRect frame = CGRectZero;
  frame.origin.x = 25;
  frame.origin.y = 15;
  frame.size.width = CGRectGetWidth(self.contentView.frame) - 15 - 25;
  frame.size.height = 22;
  self.nameLabel.frame = frame;
}

- (void)setupMessageLabel
{
  UILabel *message = [UILabel new];
  [self.contentView addSubview:message];
  self.messageLabel = message;
  
  message.font = [UIFont systemFontOfSize:12];
  message.numberOfLines = 2;
  message.textAlignment = NSTextAlignmentLeft;
  
  CGRect frame = CGRectZero;
  frame.origin.x = 25;
  frame.origin.y = CGRectGetMaxY(self.nameLabel.frame)+4;
  frame.size.width = CGRectGetWidth(self.contentView.frame) - 40-25;
  frame.size.height = 44;
  self.messageLabel.frame = frame;
}

- (void)setupTimeLabel
{
  UILabel *time = [UILabel new];
  [self.contentView addSubview:time];
  self.timeLabel = time;

  time.font = [UIFont systemFontOfSize:9];
  time.textAlignment = NSTextAlignmentRight;
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetWidth(self.contentView.frame) - 90;
  frame.origin.y = 10;
  frame.size.width = 80;
  frame.size.height = 13;
  self.timeLabel.frame = frame;
}

- (void)layoutSubviews
{
  [self.messageLabel sizeToFit];
}


@end
