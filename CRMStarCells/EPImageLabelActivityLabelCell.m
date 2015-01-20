//
//  EPImageLabelActivityLabelCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPImageLabelActivityLabelCell.h"

@implementation EPImageLabelActivityLabelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    UILabel *score = [[UILabel alloc]initWithFrame:CGRectMake(self.contentWidth-80, CGRectGetMinY(self.titleLabel.frame)+10, 80, 23)];
    score.font = [UIFont systemFontOfSize:19];
    score.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:score];
    self.scoreLabel = score;
    UILabel *total = [[UILabel alloc]initWithFrame:CGRectMake(self.contentWidth-80, CGRectGetMaxY(self.scoreLabel.frame), 80, 14)];
    total.font = [UIFont systemFontOfSize:10];
    total.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:total];
    self.totalScoreLabel = total;
  }
  return self;
}

- (void)configureWithTitle:(NSString *)title activityText:(NSString *)activityText score:(NSNumber *)score OutOf:(NSString *)totalScore
{
  [super configureWithTitle:title activityText:activityText];
  self.scoreLabel.text = [NSString stringWithFormat:@"%@", score];
  self.totalScoreLabel.text = totalScore;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

@end
