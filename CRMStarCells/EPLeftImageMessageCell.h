//
//  EPLeftImageMessageCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString* EPLeftImageMessageCellIdentifier = @"LeftImageMessageCellIdentifier";

@interface EPLeftImageMessageCell : UITableViewCell

@property (weak, nonatomic) UIImageView *profileImageView;
@property (weak, nonatomic) UILabel *dateLabel;
@property (weak, nonatomic) UIImageView *messageImageView;
@property CGFloat contentWidth;

- (void)configureWithProfileImage:(UIImage *)image time:(NSString *)timeString messageImage:(UIImage *)messageImage;

@end
