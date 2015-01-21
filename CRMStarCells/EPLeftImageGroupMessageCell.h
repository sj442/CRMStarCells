//
//  EPLeftImageGroupMessageCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPLeftImageMessageCell.h"

static NSString* EPLeftImageGroupMessageCellIdentifier = @"LeftImageGroupMessageCellIdentifier";

@interface EPLeftImageGroupMessageCell : EPLeftImageMessageCell

@property (weak, nonatomic) UILabel *nameLabel;

- (void)configureWithName:(NSString *)name profileImage:(UIImage *)image time:(NSString *)timeString messageImage:(UIImage *)messageImage;

@end
