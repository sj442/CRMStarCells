//
//  EPLeftImageMessageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPLeftImageMessageCell.h"

@implementation EPLeftImageMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.contentWidth = [[UIScreen mainScreen] bounds].size.width;
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 44, 44)];
    iv.layer.cornerRadius = 4;
    iv.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iv];
    self.profileImageView = iv;
    UILabel *date = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(self.profileImageView.frame)+5, 54, 16)];
    date.font = [UIFont systemFontOfSize:12];
    date.textColor = [UIColor grayColor];
    [self.contentView addSubview:date];
    self.dateLabel = date;
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(69, 15, 150, 100)];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:imageView];
    self.messageImageView = imageView;
  }
  return self;
}

- (void)configureWithProfileImage:(UIImage *)image time:(NSString *)timeString messageImage:(UIImage *)messageImage
{
  self.profileImageView.image = image;
  self.dateLabel.text = timeString;
  self.messageImageView.image = messageImage;
}

@end
