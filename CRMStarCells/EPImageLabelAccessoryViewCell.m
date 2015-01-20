//
//  ImageLabelAccessoryViewCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPImageLabelAccessoryViewCell.h"
#import "NSString+EP.h"

@implementation EPImageLabelAccessoryViewCell

+(CGFloat)contentLabelWidth
{
  return [[UIScreen mainScreen] bounds].size.width - 80-63;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.contentWidth = [[UIScreen mainScreen] bounds].size.width;
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9, 17, 150, 18)];
    [self.contentView addSubview:title];
    self.titleLabel = title;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    UILabel *subTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9, CGRectGetMaxY(self.titleLabel.frame)+5, 150, 17)];
    [self.contentView addSubview:subTitle];
    self.subTitleLabel = subTitle;
    self.subTitleLabel.font = [UIFont systemFontOfSize:13];
    UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9, CGRectGetMaxY(self.subTitleLabel.frame)+3, self.contentWidth-63-80, 32)];
    descLabel.numberOfLines = 2;
    descLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:descLabel];
    self.descriptionLabel = descLabel;
    UILabel *accessoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.contentWidth-80, CGRectGetMaxY(self.titleLabel.frame)+20, 80, 44)];
    self.accessoryLabel = accessoryLabel;
    self.accessoryLabel.textAlignment = NSTextAlignmentRight;
    self.accessoryView = accessoryLabel;
  }
  return self;
}

- (void)configureWithTitle:(NSString *)title subTitle:(NSString *)subTitle descriptionText:(NSString *)descriptionText accessoryText:(NSString *)accessoryText
{
  CGFloat descriptionTextHeight = [descriptionText heightForTextHavingWidth:CGRectGetWidth(self.descriptionLabel.frame) font:[UIFont systemFontOfSize:12] maxLines:2];
  self.titleLabel.text = title;
  self.subTitleLabel.text = subTitle;
  self.descriptionLabel.text = descriptionText;
  self.accessoryLabel.text = accessoryText;
  CGRect frame = self.descriptionLabel.frame;
  frame.origin.y = CGRectGetMaxY(self.subTitleLabel.frame)+3;
  frame.size.height = descriptionTextHeight;
  self.descriptionLabel.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
