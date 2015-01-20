//
//  ImageLabelAccessoryViewCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPImageLabelCell.h"

static NSString* EPImageLabelAccessoryViewCellIdentifier = @"ImageLabelAccessoryViewCell";

@interface EPImageLabelAccessoryViewCell : EPImageLabelCell

@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *subTitleLabel;
@property (weak, nonatomic) UILabel *descriptionLabel;
@property (weak, nonatomic) UILabel *accessoryLabel;
@property CGFloat contentWidth;

+(CGFloat)contentLabelWidth;

- (void)configureWithTitle:(NSString *)title subTitle:(NSString *)subTitle descriptionText:(NSString *)descriptionText accessoryText:(NSString *)accessoryText;

@end
