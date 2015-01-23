//
//  EPTitleTextImageCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPUpdateBaseTableViewCell.h"

@interface EPUpdateNoteTableViewCell : EPUpdateBaseTableViewCell

@property (weak, nonatomic) UIImageView *contentImageView;

@property (weak, nonatomic) UILabel *contentLabel;

@property NSInteger type;

+ (CGFloat)contentLabelWidthInTableViewWithWidth:(CGFloat)width;

+ (CGFloat)recommnendedHeight;

@end
