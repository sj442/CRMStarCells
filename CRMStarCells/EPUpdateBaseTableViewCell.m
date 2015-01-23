//
//  EPImageLabelCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPUpdateBaseTableViewCell.h"

@interface EPUpdateBaseTableViewCell ()

@property (weak, nonatomic) UIImageView *clockImageView;

@end

@implementation EPUpdateBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    [self setupUserImageView];
    
    [self setupTypeLabel];
    
    [self setupPrimaryLabel];
    
    [self setupClockImageView];
    
    [self setupTimeLabel];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  CGRect frame = self.clockImageView.frame;
  frame.origin.y = CGRectGetMaxY(self.contentView.frame)-22;
  self.clockImageView.frame = frame;
  frame = self.timeLabel.frame;
  frame.origin.y = CGRectGetMaxY(self.contentView.frame) -24;
  self.timeLabel.frame = frame;
}

- (void)setupUserImageView
{
  UIImageView *iv = [UIImageView new];
  [self.contentView addSubview:iv];
  self.userImageView = iv;
  
  iv.layer.cornerRadius = 4.0f;
  iv.backgroundColor = [UIColor redColor];
  
  CGRect frame = CGRectZero;
  frame.origin.x = 10;
  frame.origin.y = 16;
  frame.size.width = 44;
  frame.size.height = 44;
  iv.frame = frame;
}

- (void)setupTypeLabel
{
  UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.userImageView.frame)+5.0f, 44, 24)];
  label.layer.cornerRadius = 3.0f;
  label.clipsToBounds = YES;
  label.backgroundColor = [UIColor blueColor];
  label.font = [UIFont systemFontOfSize:12];
  label.textColor = [UIColor whiteColor];
  label.textAlignment = NSTextAlignmentCenter;
  label.text = @"NOTE";
  [self.contentView addSubview:label];
  self.typeLabel = label;
}

- (void)setupPrimaryLabel
{
  UILabel *primaryLabel = [UILabel new];
  [self.contentView addSubview:primaryLabel];
  self.primaryLabel = primaryLabel;
  
  primaryLabel.font = [UIFont boldSystemFontOfSize:14];
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetMaxX(self.userImageView.frame) +9.0f;
  frame.origin.y = 17;
  frame.size.width = CGRectGetWidth(self.contentView.frame) - 15 - 63;
  frame.size.height = 18;
  self.primaryLabel.frame = frame;
}

- (void)setupClockImageView
{
  UIImageView *clock = [UIImageView new];
  [self.contentView addSubview:clock];
  self.clockImageView = clock;
  
  clock.image = [UIImage imageNamed:@"clock.png"];
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetMaxX(self.userImageView.frame)+9.0f;
  frame.origin.y = CGRectGetHeight(self.contentView.frame) - 21.0f;
  frame.size.width = 11;
  frame.size.height = 11;
  self.clockImageView.frame = frame;
}

- (void)setupTimeLabel
{
  UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.clockImageView.frame)+6, CGRectGetHeight(self.contentView.frame)-12.0f, 50, 16)];
  [self.contentView addSubview:timeLabel];
  self.timeLabel = timeLabel;
  
  timeLabel.font = [UIFont systemFontOfSize:12];
  self.timeLabel.text = @"just now";
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetMaxX(self.clockImageView.frame)+6;
  frame.origin.y = CGRectGetMaxY(self.contentView.frame) - 26.0f;
  frame.size.width = 60;
  frame.size.height = 16;
  self.timeLabel.frame = frame;
}
@end
