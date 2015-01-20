//
//  EPTitleImageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPTitleImageCell.h"
#import "NSString+EP.h"

@implementation EPTitleImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
  }
  return  self;
}

- (void)congifureWithTitle:(NSString *)title image:(UIImage *)image time:(NSString *)time
{
  CGFloat titleTextHeight = [title heightForTextHavingWidth:CGRectGetWidth(self.titleLabel.frame) font:[UIFont boldSystemFontOfSize:14]];
  CGRect frame = self.titleLabel.frame;
  frame.size.height = titleTextHeight;
  self.titleLabel.frame = frame;
  self.titleLabel.text = title;
  frame = self.contentLabel.frame;
  frame.size.height = 0;
  self.contentLabel.frame = frame;
  frame = self.contentImageView.frame;
  frame.origin.y = CGRectGetMaxY(self.titleLabel.frame)+11;
  self.contentImageView.frame = frame;
  self.contentImageView.image = image;
  frame = self.clockImageView.frame;
  frame.origin.y = CGRectGetMaxY(self.contentImageView.frame)+11;
  self.clockImageView.frame = frame;
  CGFloat timeTextHeight = [time heightForTextHavingWidth:CGRectGetWidth(self.timeLabel.frame) font:[UIFont systemFontOfSize:12]];
  frame = self.timeLabel.frame;
  frame.origin.y = CGRectGetMaxY(self.contentImageView.frame)+11;
  frame.size.height = timeTextHeight;
  self.timeLabel.text =time;
  self.timeLabel.frame = frame;
}


@end
