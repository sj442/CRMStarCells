//
//  EPTitleTextImageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPTitleTextImageCell.h"
#import "NSString+EP.h"

@implementation EPTitleTextImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.contentWidth = [[UIScreen mainScreen] bounds].size.width;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9.0f, 17, 150, 15)];
    label.font = [UIFont boldSystemFontOfSize:14];
    [self.contentView addSubview:label];
    self.titleLabel = label;
    UILabel *fullTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9.0f, CGRectGetMaxY(self.titleLabel.frame)+11.0f,self.contentWidth-63-15, 80)];
    fullTextLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:fullTextLabel];
    self.contentLabel = fullTextLabel;
    self.contentLabel.numberOfLines = 4;
    UIImageView *content = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9.0f, CGRectGetMaxY(self.contentLabel.frame)+15, self.contentWidth-15-63, 100)];
    [self.contentView addSubview:content];
    self.contentImageView = content;
  }
  return self;
}

- (void)configureWithTitle:(NSString *)title contentText:(NSString *)contentText contentImage:(UIImage *)contentImage time:(NSString *)time
{
  CGFloat titleTextHeight = [title heightForTextHavingWidth:CGRectGetWidth(self.titleLabel.frame) font:[UIFont boldSystemFontOfSize:14]];
  CGFloat contentTextHeight;
  if (!contentImage) {
    contentTextHeight = [contentText heightForTextHavingWidth:CGRectGetWidth(self.contentLabel.frame) font:[UIFont systemFontOfSize:14] maxLines:4];
  } else {
    contentTextHeight = [contentText heightForTextHavingWidth:CGRectGetWidth(self.contentLabel.frame) font:[UIFont systemFontOfSize:14] maxLines:3];
  }
  CGFloat timeTextHeight = [time heightForTextHavingWidth:CGRectGetWidth(self.timeLabel.frame) font:[UIFont systemFontOfSize:12]];
  CGRect frame = self.titleLabel.frame;
  frame.size.height = titleTextHeight;
  self.titleLabel.frame = frame;
  frame = self.contentLabel.frame;
  frame.origin.y = CGRectGetMaxY(self.titleLabel.frame) +11;
  frame.size.height = contentTextHeight;
  self.contentLabel.frame = frame;
  frame = self.contentImageView.frame;
  frame.origin.y = CGRectGetMaxY(self.contentLabel.frame)+15;
  if (!contentImage) {
    frame.size.height = 0;
  }
  self.contentImageView.frame = frame;
  frame = self.clockImageView.frame;
  frame.origin.y = CGRectGetMaxY(self.contentImageView.frame)+11;
  self.clockImageView.frame = frame;
  frame = self.timeLabel.frame;
  frame.size.height = timeTextHeight;
  frame.origin.y = CGRectGetMaxY(self.contentImageView.frame)+11;
  self.timeLabel.frame = frame;
  self.titleLabel.text = title;
  self.contentLabel.text = contentText;
  self.contentImageView.image = contentImage;
  self.timeLabel.text = time;
}

- (void)congifureWithTitle:(NSString *)title image:(UIImage *)image time:(NSString *)time
{
  [self configureWithTitle:title contentText:nil contentImage:image time:time];
}

- (void)configureWithTitle:(NSString *)title contentText:(NSString *)contentText time:(NSString *)time
{
  [self configureWithTitle:title contentText:contentText contentImage:nil time:time];
}

@end
