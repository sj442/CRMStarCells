//
//  EPLeftImageGroupMessageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPLeftImageGroupMessageCell.h"

@implementation EPLeftImageGroupMessageCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
      UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(79, 5, 100, 14)];
      name.font= [UIFont systemFontOfSize:10];
      name.textColor = [UIColor grayColor];
      [self.contentView addSubview:name];
      self.nameLabel = name;
  }
  return self;
}

- (void)configureWithName:(NSString *)name profileImage:(UIImage *)image time:(NSString *)timeString messageImage:(UIImage *)messageImage
{
  [super configureWithProfileImage:image time:timeString messageImage:messageImage];
  self.nameLabel.text = name;
  CGRect frame = self.messageImageView.frame;
  frame.origin.y = CGRectGetMaxY(self.nameLabel.frame)+2;
  self.messageImageView.frame = frame;
}

@end
