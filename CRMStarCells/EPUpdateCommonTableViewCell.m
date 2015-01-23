//
//  EPImageLabelActivityCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPUpdateCommonTableViewCell.h"
#import "NSString+EP.h"

@implementation EPUpdateCommonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    [self setupDescriptionLabel];
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

- (void)setupDescriptionLabel
{
  UILabel *descriptionLabel = [UILabel new];
  [self.contentView addSubview:descriptionLabel];
  self.descriptionLabel = descriptionLabel;
  
  descriptionLabel.font = [UIFont systemFontOfSize:13];
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetMaxX(self.userImageView.frame)+9;
  frame.origin.y = CGRectGetMaxY(self.primaryLabel.frame) + 11;
  frame.size.width = CGRectGetWidth(self.contentView.frame) - 80 - 63;
  frame.size.height = 17;
  self.descriptionLabel.frame= frame;
}

+ (CGFloat)recommendedHeight
{
  return MAX(17+18+11+17+10+16+10, 16+44+5+24+10);
}

@end
