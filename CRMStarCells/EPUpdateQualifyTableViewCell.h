//
//  EPImageLabelActivityLabelCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPUpdateCommonTableViewCell.h"

@interface EPUPdateQualifyTableViewCell : EPUpdateCommonTableViewCell

@property (weak, nonatomic) UILabel *scoreLabel;

@property (weak, nonatomic) UILabel *maxScoreLabel;

- (void)setScore:(NSNumber *)score maxScore:(NSNumber *)maxScore;

@end
