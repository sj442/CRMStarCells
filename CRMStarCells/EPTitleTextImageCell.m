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

+(CGFloat)contentLabelWidth
{
  return [[UIScreen mainScreen] bounds].size.width - 15-63;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.contentWidth = [[UIScreen mainScreen] bounds].size.width;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9.0f, 17, 150, 18)];
    label.font = [UIFont boldSystemFontOfSize:14];
    [self.contentView addSubview:label];
    self.titleLabel = label;
    UILabel *fullTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9.0f, CGRectGetMaxY(self.titleLabel.frame)+5.0f,self.contentWidth-63-15, 44)];
    fullTextLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:fullTextLabel];
    self.contentLabel = fullTextLabel;
    self.contentLabel.numberOfLines = 4;
    UIImageView *content = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9.0f, CGRectGetMaxY(self.contentLabel.frame)+11, self.contentWidth-15-63, 100)];
    [self.contentView addSubview:content];
    self.contentImageView = content;
    self.contentImageView.contentMode = UIViewContentModeScaleToFill;
  }
  return self;
}

- (void)configureWithTitle:(NSString *)title contentText:(NSString *)contentText contentImage:(UIImage *)contentImage time:(NSString *)time
{
  CGFloat contentTextHeight;
  if (!contentImage) {
    contentTextHeight = [contentText heightForTextHavingWidth:CGRectGetWidth(self.contentLabel.frame) font:[UIFont systemFontOfSize:14] maxLines:4];
  } else {
    contentTextHeight = [contentText heightForTextHavingWidth:CGRectGetWidth(self.contentLabel.frame) font:[UIFont systemFontOfSize:14] maxLines:3];
  }
  CGRect frame = self.contentLabel.frame;
  frame.origin.y = CGRectGetMaxY(self.titleLabel.frame) +5;
  frame.size.height = contentTextHeight;
  self.contentLabel.frame = frame;
  frame = self.contentImageView.frame;
  if (!contentText) {
    frame.origin.y = CGRectGetMaxY(self.titleLabel.frame)+11;
  } else {
    frame.origin.y = CGRectGetMaxY(self.contentLabel.frame)+11;
  }
  if (!contentImage) {
    frame.size.height = 0;
  }
  self.contentImageView.frame = frame;
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
