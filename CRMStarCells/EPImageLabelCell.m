//
//  EPImageLabelCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPImageLabelCell.h"

@implementation EPImageLabelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(10, 16, 44, 44)];
    iv.layer.cornerRadius = 4.0f;
    iv.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iv];
    self.profileImageView = iv;
    self.profileImageView.image = self.profileImage;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.profileImageView.frame)+5.0f, 44, 24)];
    label.layer.cornerRadius = 3.0f;
    label.clipsToBounds = YES;
    label.backgroundColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"NOTE";
    [self.contentView addSubview:label];
    self.typeLabel = label;
    UIImageView *clock = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame)+9.0f, CGRectGetHeight(self.contentView.frame)-12.0f, 11, 11)];
    clock.image = [UIImage imageNamed:@"clock.png"];
    [self.contentView addSubview:clock];
    self.clockImageView = clock;
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.clockImageView.frame)+6, CGRectGetHeight(self.contentView.frame)-12.0f, 50, 13)];
    timeLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    self.timeLabel.text = @"just now";
  }
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
