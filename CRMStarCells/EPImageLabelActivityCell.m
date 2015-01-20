//
//  EPImageLabelActivityCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPImageLabelActivityCell.h"
#import "NSString+EP.h"

@implementation EPImageLabelActivityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.profileImageView.frame)+9, 17, 150, 20)];
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    UILabel *activityLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.profileImageView.frame)+9, CGRectGetMaxY(self.titleLabel.frame)+11, 150, 20)];
    [self.contentView addSubview:activityLabel];
    self.activityLabel = activityLabel;
  }
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureWithTitle:(NSString *)title activityText:(NSString *)activityText accessoryImage:(UIImage *)image
{
  [self configureWithTitle:title activityText:activityText];
  
}

- (void)configureWithTitle:(NSString *)title activityText:(NSString *)activityText accessoryText:(NSString *)text
{
  [self configureWithTitle:title activityText:activityText];
  
}

- (void)configureWithTitle:(NSString *)title activityText:(NSString *)activityText
{
  CGFloat titleTextHeight = [title heightForTextHavingWidth:CGRectGetWidth(self.titleLabel.frame) font:[UIFont boldSystemFontOfSize:14]];
  self.titleLabel.text = title;
  CGFloat activityTextHeigt = [activityText heightForTextHavingWidth:CGRectGetWidth(self.activityLabel.frame) font:[UIFont systemFontOfSize:13]];
  self.activityLabel.text = activityText;
  CGRect frame = self.titleLabel.frame;
  frame.size.height = titleTextHeight;
  self.titleLabel.frame = frame;
  frame = self.activityLabel.frame;
  frame.origin.y = CGRectGetMaxY(self.titleLabel.frame)+11;
  frame.size.height = activityTextHeigt;
  self.activityLabel.frame = frame;
  frame = self.clockImageView.frame;
  frame.origin.y = CGRectGetMaxY(self.activityLabel.frame)+11;
  self.clockImageView.frame= frame;
  frame = self.timeLabel.frame;
  frame.origin.y = CGRectGetMaxY(self.activityLabel.frame) +11;
  self.timeLabel.frame= frame;
}

@end
