//
//  EPImageLabelActivityCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPImageLabelCell.h"

@interface EPImageLabelActivityCell : EPImageLabelCell

@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *activityLabel;
@property CGFloat contentWidth;

- (void)configureWithTitle:(NSString *)title activityText:(NSString *)activityText;


@end
