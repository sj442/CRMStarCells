//
//  EPLeftTextMessageCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPMessageLabel.h"

static NSString* EPLeftTextMessageCellIdentifier = @"LeftTextMessageCellIdentifier";

@interface EPLeftTextMessageCell : UITableViewCell

@property (weak, nonatomic) UIImageView *profileImageView;
@property (weak, nonatomic) UILabel *dateLabel;
@property (weak, nonatomic) EPMessageLabel *messageLabel;
@property CGFloat contentWidth;

+(CGFloat)messageLabelWidth;

- (void)configureWithProfileImage:(UIImage *)image time:(NSString *)timeString message:(NSString *)message;


@end
