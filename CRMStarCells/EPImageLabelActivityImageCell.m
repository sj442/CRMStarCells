//
//  EPImageLabelActivityImageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPImageLabelActivityImageCell.h"

@implementation EPImageLabelActivityImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(self.contentWidth-80, 0, 80, 80)];
    iv.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:iv];
    self.activityImageView = iv;
  }
  return self;
}

- (void)configureWithTitle:(NSString *)title activityText:(NSString *)activityText activityImage:(UIImage *)activityImage
{
  [super configureWithTitle:title activityText:activityText];
  self.activityImageView.image = activityImage;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
