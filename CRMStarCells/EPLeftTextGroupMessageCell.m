//
//  EPLeftTextGroupMessageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPLeftTextGroupMessageCell.h"
#import "NSString+EP.h"

@implementation EPLeftTextGroupMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
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

- (void)configureWithName:(NSString *)name profileImage:(UIImage *)image time:(NSString *)timeString message:(NSString *)message
{
  [super configureWithProfileImage:image time:timeString message:message];
  self.nameLabel.text = name;
  CGRect frame = self.messageLabel.frame;
  frame.origin.y = CGRectGetMaxY(self.nameLabel.frame) +2;
  CGFloat messageHeight = [message heightForTextHavingWidth:self.contentWidth-69-15-20 font:[UIFont systemFontOfSize:13]];
  frame.size.height = messageHeight+20;
  self.messageLabel.frame = frame;
}

@end
