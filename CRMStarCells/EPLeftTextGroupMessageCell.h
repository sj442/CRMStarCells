//
//  EPLeftTextGroupMessageCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPMessageLabel.h"
#import "EPLeftTextMessageCell.h"

static NSString* EPLeftTextGroupMessageCellIdentifier = @"LeftTextGroupMessageCellIdentifier";

@interface EPLeftTextGroupMessageCell : EPLeftTextMessageCell

@property (weak, nonatomic) UILabel *nameLabel;

- (void)configureWithName:(NSString *)name profileImage:(UIImage *)image time:(NSString *)timeString message:(NSString *)message;


@end
