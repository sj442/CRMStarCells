//
//  EPTitleImageCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPTitleTextImageCell.h"

static NSString* EPTitleImageCellIdentifier = @"TitleImage";

@interface EPTitleImageCell : EPTitleTextImageCell

- (void)congifureWithTitle:(NSString *)title image:(UIImage *)image time:(NSString *)time;

@end
