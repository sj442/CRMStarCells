//
//  EPImageLabelActivityCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPUpdateBaseTableViewCell.h"

@interface EPUpdateCommonTableViewCell : EPUpdateBaseTableViewCell

@property (weak, nonatomic) UILabel *descriptionLabel;

+ (CGFloat)recommendedHeight;


@end
