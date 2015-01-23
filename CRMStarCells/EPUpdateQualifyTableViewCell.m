//
//  EPImageLabelActivityLabelCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPUpdateQualifyTableViewCell.h"

@implementation EPUPdateQualifyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    self.typeLabel.text = @"QLFY";
    
    [self setupScoreLabel];
    
    [self setupMaxScoreLabel];
  }
  return self;
}

- (void)setupScoreLabel
{
  UILabel *score = [UILabel new];
  [self.contentView addSubview:score];
  self.scoreLabel = score;

  score.font = [UIFont systemFontOfSize:19];
  score.textAlignment = NSTextAlignmentCenter;
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetWidth(self.contentView.frame) - 80;
  frame.origin.y = CGRectGetMinY(self.primaryLabel.frame) + 10;
  frame.size.width = 80;
  frame.size.height = 23;
  self.scoreLabel.frame = frame;
}

- (void)setupMaxScoreLabel
{
  UILabel *total = [UILabel new];
  [self.contentView addSubview:total];
  self.maxScoreLabel = total;

  total.font = [UIFont systemFontOfSize:10];
  total.textAlignment = NSTextAlignmentCenter;
  
  CGRect frame = CGRectZero;
  frame.origin.x = CGRectGetWidth(self.contentView.frame) - 80;
  frame.origin.y = CGRectGetMaxY(self.scoreLabel.frame);
  frame.size.width = 80;
  frame.size.height = 14;
  self.maxScoreLabel.frame = frame;
}

- (void)setScore:(NSNumber *)score maxScore:(NSNumber *)maxScore
{
  self.scoreLabel.text = [NSString stringWithFormat:@"%@",score];
  self.maxScoreLabel.text = [NSString stringWithFormat:@"out of %@",maxScore];
}

@end
