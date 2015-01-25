//
//  EPImageLabelCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPUpdateBaseTableViewCell : UITableViewCell

/*
 base cell class for all update cells
*/
@property (weak, nonatomic) UIImageView *userImageView;

@property (weak, nonatomic) UILabel *typeLabel;

@property (weak, nonatomic) UILabel *timeLabel;

@property (weak, nonatomic) UILabel *primaryLabel;

@end
