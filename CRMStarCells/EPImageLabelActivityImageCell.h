//
//  EPImageLabelActivityImageCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPImageLabelActivityCell.h"

static NSString* EPImageLabelActivityImageCellIdentifier = @"ImageLabelActivityImageCell";

@interface EPImageLabelActivityImageCell : EPImageLabelActivityCell

@property (weak, nonatomic) UIImageView *activityImageView;

- (void)configureWithTitle:(NSString *)title activityText:(NSString *)activityText activityImage:(UIImage *)activityImage;


@end
