//
//  ImageLabelAccessoryViewCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPUpdateBaseTableViewCell.h"


@interface EPUpdateOpportunityTableViewCell : EPUpdateBaseTableViewCell

@property (weak, nonatomic) UILabel *nameLabel;

@property (weak, nonatomic) UILabel *subNameLabel;

@property (weak, nonatomic) UILabel *descriptionLabel;

@property (weak, nonatomic) UILabel *accessoryLabel;

+ (CGFloat)recommendedHeight;

@end
