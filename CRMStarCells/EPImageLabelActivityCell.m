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
    self.contentWidth = [[UIScreen mainScreen] bounds].size.width;
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9, 17, 150, 18)];
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    UILabel *activityLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9, CGRectGetMaxY(self.titleLabel.frame)+11, 150, 17)];
    activityLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:activityLabel];
    self.activityLabel = activityLabel;
  }
  return self;
}

- (void)configureWithTitle:(NSString *)title activityText:(NSString *)activityText
{
  self.titleLabel.text = title;
  self.activityLabel.text = activityText;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
