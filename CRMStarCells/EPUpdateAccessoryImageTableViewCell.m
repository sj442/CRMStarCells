//
//  EPImageLabelActivityImageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPUpdateAccessoryImageTableViewCell.h"

@interface EPUpdateAccessoryImageTableViewCell ()

@end

@implementation EPUpdateAccessoryImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    [self setupAccessoryImageView];

  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  [self setAccessoryImageViewImageAndTypeLabelText];
}

- (void)setupAccessoryImageView
{
  UIImageView *iv = [UIImageView new];
  [self.contentView addSubview:iv];
  self.accessoryImageView = iv;
  
  iv.contentMode = UIViewContentModeCenter;
  iv.backgroundColor = [UIColor yellowColor];
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetWidth(self.contentView.frame) - 80;
  frame.origin.y = 0;
  frame.size.width = 80;
  frame.size.height = 80;
  self.accessoryImageView.frame = frame;
}

- (void)setAccessoryImageViewImageAndTypeLabelText
{
  switch (self.activityType) {
    case 2:
      self.accessoryImageView.image = [UIImage imageNamed:@"call"];
      self.typeLabel.text = @"CALL";
      break;
    case 3:
      self.accessoryImageView.image = [UIImage imageNamed:@"email"];
      self.typeLabel.text = @"EMAIL";
      break;
    case 4:
      self.accessoryImageView.image = [UIImage imageNamed:@"task"];
      self.typeLabel.text = @"TASK";
    case 5:
      self.accessoryImageView.image = [UIImage imageNamed:@"event"];
      self.typeLabel.text = @"EVENT";
      break;
  }
}
     
@end
