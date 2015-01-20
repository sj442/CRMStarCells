//
//  EPTitleTextImageCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPImageLabelCell.h"

static NSString* EPTitleTextImageCellIdentifier = @"TitleTextImage";

@interface EPTitleTextImageCell : EPImageLabelCell

@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UIImageView *contentImageView;
@property (weak, nonatomic) UILabel *contentLabel;
@property CGFloat contentWidth;

- (void)configureWithTitle:(NSString *)title contentText:(NSString *)contentText contentImage:(UIImage *)contentImage time:(NSString *)time;

- (void)congifureWithTitle:(NSString *)title image:(UIImage *)image time:(NSString *)time;

- (void)configureWithTitle:(NSString *)title contentText:(NSString *)contentText time:(NSString *)time;


@end
