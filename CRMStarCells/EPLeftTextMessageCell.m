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
    EPMessageLabel *label = [[EPMessageLabel alloc]initWithFrame:CGRectMake(69, 15, self.contentWidth - 69-15, 90)];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:13];
    label.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:label];
    self.messageLabel = label;
  }
  return  self;
}

+ (CGFloat)messageLabelWidth
{
  return [UIScreen mainScreen].bounds.size.width - 69-15;
}

- (void)configureWithProfileImage:(UIImage *)image time:(NSString *)timeString message:(NSString *)message
{
  self.profileImageView.image = image;
  self.dateLabel.text = timeString;
  self.messageLabel.text = message;
  CGFloat height = [message heightForTextHavingWidth:self.contentWidth-69-16-20 font:[UIFont systemFontOfSize:13]];
  CGRect frame = self.messageLabel.frame;
  frame.size.height = height+20;
  self.messageLabel.frame = frame;
}

@end
