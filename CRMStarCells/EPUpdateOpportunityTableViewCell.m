//
//  ImageLabelAccessoryViewCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPUpdateOpportunityTableViewCell.h"
#import "NSString+EP.h"

@implementation EPUpdateOpportunityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    self.typeLabel.text = @"DEAL";
    
    [self setupNameLabel];
    
    [self setupSubNameLabel];
    
    [self setupDescriptionLabel];
    
    [self setupAccessoryLabel];
  }
  return self;
}

 - (void)layoutSubviews
{
  [super layoutSubviews];
  
  CGRect frame = self.primaryLabel.frame;
  frame.size.width = CGRectGetWidth(self.contentView.frame) -80-63;
  self.primaryLabel.frame = frame;
}

- (void)setupNameLabel
{
  UILabel *nameLabel = [UILabel new];
  [self.contentView addSubview:nameLabel];
  self.nameLabel = nameLabel;
  
  nameLabel.font = [UIFont systemFontOfSize:13];
  nameLabel.numberOfLines = 1;
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetMaxX(self.userImageView.frame)+9;
  frame.origin.y = CGRectGetMaxY(self.primaryLabel.frame) +5;
  frame.size.width = CGRectGetWidth(self.contentView.frame) - 80 - 63;
  frame.size.height = 17;
  self.nameLabel.frame = frame;
}

- (void)setupSubNameLabel
{
  UILabel *subNameLabel = [UILabel new];
  [self.contentView addSubview:subNameLabel];
  self.subNameLabel = subNameLabel;
  
  subNameLabel.numberOfLines = 1;
  subNameLabel.font = [UIFont systemFontOfSize:12];
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetMaxX(self.userImageView.frame) +9;
  frame.origin.y = CGRectGetMaxY(self.nameLabel.frame) +3;
  frame.size.width = CGRectGetWidth(self.contentView.frame) -80-63;
  frame.size.height = 16;
  self.subNameLabel.frame = frame;
}

- (void)setupDescriptionLabel
{
  UILabel *descriptionLabel = [UILabel new];
  [self.contentView addSubview:descriptionLabel];
  self.descriptionLabel = descriptionLabel;
  
  descriptionLabel.numberOfLines = 1;
  descriptionLabel.font = [UIFont systemFontOfSize:12];
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetMaxX(self.userImageView.frame) +9;
  frame.origin.y = CGRectGetMaxY(self.subNameLabel.frame) +3;
  frame.size.width = CGRectGetWidth(self.contentView.frame) -80-63;
  frame.size.height = 16;
  self.descriptionLabel.frame = frame;
}

- (void)setupAccessoryLabel
{
  UILabel *accessoryLabel = [UILabel new];
  [self.contentView addSubview:accessoryLabel];
  self.accessoryLabel = accessoryLabel;
  
  accessoryLabel.textAlignment = NSTextAlignmentRight;
  accessoryLabel.font = [UIFont systemFontOfSize:19];
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetWidth(self.contentView.frame) -80;
  frame.origin.y = CGRectGetMaxY(self.primaryLabel.frame)+20;
  frame.size.width = 80;
  frame.size.height = 44;
}

+ (CGFloat)recommendedHeight
{
  return 17+18+5+17+3+16+3+16+5+16+10;
}

@end
