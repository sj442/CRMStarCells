//
//  EPTitleTextImageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPUpdateNoteTableViewCell.h"
#import "NSString+EP.h"

@implementation EPUpdateNoteTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    [self setupContentLabel];
    
    [self setupContentImageView];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  [self setTypeLabelText];

  if (!(self.contentLabel.text == nil) && (self.contentImageView.image == nil)) {
    CGRect frame = self.contentLabel.frame;
    frame.origin.y = CGRectGetMaxY(self.primaryLabel.frame)+5;
    frame.size.height = CGRectGetHeight(self.contentView.frame) - CGRectGetMinY(frame) - CGRectGetHeight(self.timeLabel.frame) - 10 -10;
    self.contentLabel.frame = frame;
    self.contentLabel.hidden = NO;
    self.contentLabel.numberOfLines = 4;
    self.contentImageView.hidden = YES;
  } else if ((self.contentLabel.text == nil) && !(self.contentImageView.image == nil)) {
    self.contentLabel.hidden = YES;
    self.contentImageView.hidden = NO;
    CGRect frame = self.contentImageView.frame;
    frame.origin.y = CGRectGetMaxY(self.primaryLabel.frame)+10;
    self.contentImageView.frame = frame;
  } else {
    self.contentImageView.hidden = NO;
    self.contentLabel.hidden = NO;
    self.contentLabel.numberOfLines = 3;
    CGRect frame = self.contentImageView.frame;
    frame.origin.y = CGRectGetHeight(self.contentView.frame) - 10 -16- 10- 100;
    self.contentImageView.frame = frame;
    frame = self.contentLabel.frame;
    frame.origin.y = CGRectGetMaxY(self.primaryLabel.frame)+5;
    frame.size.height = CGRectGetHeight(self.contentView.frame) - CGRectGetHeight(self.contentImageView.frame) - CGRectGetMinY(self.contentLabel.frame) -5- 10-16-10;
    self.contentLabel.frame = frame;
  }
}

- (void)setTypeLabelText
{
  if (self.type == 0) {
    self.typeLabel.text = @"NOTE";
  } else {
    self.typeLabel.text = @"NEWS";
  }
}

- (void)setupContentLabel
{
  UILabel *contentLabel = [UILabel new];
  [self.contentView addSubview:contentLabel];
  self.contentLabel = contentLabel;
  
  contentLabel.font = [UIFont systemFontOfSize:14];
  contentLabel.numberOfLines = 4;
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetMaxX(self.userImageView.frame)+9;
  frame.origin.y = CGRectGetMaxY(self.primaryLabel.frame)+5;
  frame.size.width = CGRectGetWidth(self.contentView.frame) -63-15;
  frame.size.height = 44;
  self.contentLabel.frame = frame;
}

- (void)setupContentImageView
{
  UIImageView *content = [UIImageView new];
  [self.contentView addSubview:content];
  self.contentImageView = content;
  
  content.contentMode = UIViewContentModeScaleToFill;
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetMaxX(self.userImageView.frame)+9;
  frame.origin.y = CGRectGetMaxY(self.primaryLabel.frame)+10;
  frame.size.width = CGRectGetWidth(self.contentView.frame) - 15 -63;
  frame.size.height = 100;
  self.contentImageView.frame = frame;
}

+ (CGFloat)contentLabelWidthInTableViewWithWidth:(CGFloat)width
{
  return width - 63-15;
}

+ (CGFloat)recommnendedHeight
{
  return 17+18+10+16+10+10;
}

@end
