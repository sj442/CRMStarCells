//
//  EPImageLabelCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString* EPImageLabelCellIdentifier = @"ImageLabelCell";

@interface EPImageLabelCell : UITableViewCell

@property (weak, nonatomic) UIImageView *profileImageView;
@property (weak, nonatomic) UILabel *typeLabel;
@property (strong, nonatomic) UIImage *profileImage;
@property (weak, nonatomic) UIImageView *clockImageView;
@property (weak, nonatomic) UILabel *timeLabel;

@end
