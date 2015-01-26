//
//  EPRightTextMessageCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPRightTextMessageCell.h"

@implementation EPRightTextMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    CGRect frame = self.profileImageView.frame;
    frame.origin.x = CGRectGetWidth(self.contentView.frame) -59;
    self.profileImageView.frame =frame;
    frame = self.dateLabel.frame;
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    frame.origin.x = CGRectGetWidth(self.contentView.frame) - 69;
    self.dateLabel.frame = frame;
    frame = self.messageLabel.frame;
    frame.origin.x = 15;
    self.messageLabel.frame= frame;
  }
  return self;
}

@end
