//
//  EPRightTextGroupMessageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPRightTextGroupMessageCell.h"

@implementation EPRightTextGroupMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    CGRect frame = self.profileImageView.frame;
    frame.origin.x = self.contentWidth -59;
    self.profileImageView.frame =frame;
    frame = self.dateLabel.frame;
    frame.origin.x = self.contentWidth - 69;
    self.dateLabel.frame = frame;
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    frame = self.messageLabel.frame;
    frame.origin.x = 15;
    self.messageLabel.frame= frame;
    frame = self.nameLabel.frame;
    frame.origin.x = self.contentWidth -179;
    self.nameLabel.textAlignment = NSTextAlignmentRight;
    self.nameLabel.frame =frame;
  }
  return self;
}

@end
