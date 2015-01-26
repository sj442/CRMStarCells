//
//  EPMessageSummaryCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPMessageLabel.h"

static NSString* EPMessageSummaryCellIdentifier = @"MessageSummary";

@interface EPMessageSummaryCell : UITableViewCell

@property (weak, nonatomic) UIView *dotView;

@property (weak, nonatomic) UILabel *nameLabel;

@property (weak, nonatomic) UILabel *messageLabel;

@property (weak, nonatomic) UILabel *timeLabel;

@end
