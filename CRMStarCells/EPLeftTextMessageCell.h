//
//  EPLeftTextMessageCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/21/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPMessageLabel.h"

typedef NS_ENUM(NSInteger, EPChatCellType) {
  EPLeftAlignedText,
  EPRightAlignedText,
  EPLeftAlignedImage,
  EPRightAlignedImage
};

@interface EPLeftTextMessageCell : UITableViewCell

@property (weak, nonatomic) UIImageView *profileImageView;

@property (weak, nonatomic) UILabel *dateLabel;

@property (weak, nonatomic) EPMessageLabel *messageLabel;

@property (weak, nonatomic) UIImageView *messageImageView;

@property (nonatomic) EPChatCellType chatCellType;

+ (CGFloat)contentLabelWidthInTableViewWithWidth:(CGFloat)width;

@end
