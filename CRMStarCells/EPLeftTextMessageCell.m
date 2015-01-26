//
//  EPLeftTextMessageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPLeftTextMessageCell.h"
#import "NSString+EP.h"

@implementation EPLeftTextMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {    
    [self setupProfileImageView];
    
    [self setupDateLabel];
    
    [self setupMessageLabel];
    
    [self setupMessageImageView];
  }
  return  self;
}

- (void)setupProfileImageView
{
  UIImageView *iv = [UIImageView new];
  [self.contentView addSubview:iv];
  self.profileImageView = iv;
  
  iv.layer.cornerRadius = 4;
  iv.backgroundColor = [UIColor redColor];
  
  CGRect frame = CGRectZero;
  frame.origin.x = 15;
  frame.origin.y = 15;
  frame.size.width = 44;
  frame.size.height = 44;
  self.profileImageView.frame = frame;
}

- (void)setupDateLabel
{
  UILabel *date = [UILabel new];
  [self.contentView addSubview:date];
  self.dateLabel = date;
  
  date.font = [UIFont systemFontOfSize:12];
  date.adjustsFontSizeToFitWidth = YES;
  date.textColor = [UIColor grayColor];
  
  CGRect frame = CGRectZero;
  frame.origin.x = 15;
  frame.origin.y = CGRectGetMaxY(self.profileImageView.frame)+5;
  frame.size.width = 44;
  frame.size.height = 16;
  self.dateLabel.frame = frame;
}

- (void)setupMessageLabel
{
  EPMessageLabel *label = [EPMessageLabel new];
  [self.contentView addSubview:label];
  self.messageLabel = label;
  
  label.numberOfLines = 0;
  label.font = [UIFont systemFontOfSize:13];
  label.backgroundColor = [UIColor yellowColor];
  
  CGRect frame = CGRectZero;
  frame.origin.x = 69;
  frame.origin.y = 15;
  frame.size.width = CGRectGetWidth(self.contentView.frame) - 69-15;
  frame.size.height = 90;
  self.messageLabel.frame = frame;
}

- (void)setupMessageImageView
{
  UIImageView *imageView =[UIImageView new];
  [self.contentView addSubview:imageView];
  self.messageImageView = imageView;
  
  imageView.contentMode = UIViewContentModeScaleToFill;
  
  CGRect frame = CGRectZero;
  frame.origin.x = 69;
  frame.origin.y = 15;
  frame.size.width = 150;
  frame.size.height = 100;
  self.messageImageView.frame = frame;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  if (self.chatCellType == EPLeftAlignedText) {
    self.messageImageView.hidden = YES;
    self.messageLabel.hidden = NO;
    
    CGRect frame = self.profileImageView.frame;
    frame.origin.x = 15;
    self.profileImageView.frame =frame;
    
    frame = self.dateLabel.frame;
    frame.origin.x = 15;
    self.dateLabel.frame = frame;
    
    frame = self.messageLabel.frame;
    frame.size.height = CGRectGetHeight(self.contentView.frame) - 15-15;
    self.messageLabel.frame = frame;
    
  } else if (self.chatCellType == EPRightAlignedText) {
    self.messageImageView.hidden = YES;
    self.messageLabel.hidden = NO;
    
    CGRect frame = self.profileImageView.frame;
    frame.origin.x = CGRectGetWidth(self.contentView.frame) -59;
    self.profileImageView.frame =frame;
    
    frame = self.dateLabel.frame;
    frame.origin.x = CGRectGetWidth(self.contentView.frame) - 69;
    self.dateLabel.frame = frame;
    
    frame = self.messageLabel.frame;
    frame.origin.x = 15;
    self.messageLabel.frame= frame;
    
  } else if (self.chatCellType == EPLeftAlignedImage) {
    self.messageImageView.hidden = NO;
    self.messageLabel.hidden = YES;
    
    CGRect frame = self.profileImageView.frame;
    frame.origin.x = 15;
    self.profileImageView.frame =frame;
    
    frame = self.dateLabel.frame;
    frame.origin.x = 15;
    self.dateLabel.frame = frame;

  } else if (self.chatCellType == EPRightAlignedImage) {
    self.messageImageView.hidden = NO;
    self.messageLabel.hidden = YES;
    
    CGRect frame = self.profileImageView.frame;
    frame.origin.x = CGRectGetWidth(self.contentView.frame) -59;
    self.profileImageView.frame =frame;
    
    frame = self.dateLabel.frame;
    frame.origin.x = CGRectGetWidth(self.contentView.frame) - 69;
    self.dateLabel.frame = frame;
    
    frame = self.messageImageView.frame;
    frame.origin.x = CGRectGetWidth(self.contentView.frame)-59-15-150;
    self.messageImageView.frame = frame;
  }
}

+ (CGFloat)contentLabelWidthInTableViewWithWidth:(CGFloat)width;
{
  return width - 69-15-20;
}

@end
