//
//  EPLeftTextGroupMessageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPLeftTextGroupMessageCell.h"
#import "NSString+EP.h"

@implementation EPLeftTextGroupMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    [self setupNameLabel];
  }
  return self;
}

- (void)setupNameLabel
{
  UILabel *name = [UILabel new];
  [self.contentView addSubview:name];
  self.nameLabel = name;
  
  name.font= [UIFont systemFontOfSize:10];
  name.textColor = [UIColor grayColor];
  name.textAlignment = NSTextAlignmentLeft;
  
  CGRect frame = CGRectZero;
  frame.origin.x = 79;
  frame.origin.y = 5;
  frame.size.width = 100;
  frame.size.height = 14;
  self.nameLabel.frame = frame;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  if (self.chatCellType == EPRightAlignedImage || self.chatCellType == EPRightAlignedText) {
    CGRect frame = self.nameLabel.frame;
    frame.origin.x = CGRectGetWidth(self.contentView.frame) -179;
    self.nameLabel.frame = frame;
    
    self.nameLabel.textAlignment = NSTextAlignmentRight;
  }
  
    CGRect frame = self.messageImageView.frame;
    frame.origin.y = CGRectGetMaxY(self.nameLabel.frame)+2;
    self.messageImageView.frame = frame;
    
    frame = self.messageLabel.frame;
    frame.origin.y = CGRectGetMaxY(self.nameLabel.frame)+2;
    self.messageLabel.frame = frame;
}

@end
