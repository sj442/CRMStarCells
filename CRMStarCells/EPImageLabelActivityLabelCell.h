//
//  EPImageLabelActivityLabelCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPImageLabelActivityCell.h"

static NSString* EPImageLabelActivityLabelCellIdentifier = @"ImageLabelActivityLabelCell";

@interface EPImageLabelActivityLabelCell : EPImageLabelActivityCell

@property (weak, nonatomic) UILabel *scoreLabel;
@property (weak, nonatomic) UILabel *totalScoreLabel;

- (void)configureWithTitle:(NSString *)title activityText:(NSString *)activityText score:(NSNumber *)score OutOf:(NSString *)totalScore;


@end
