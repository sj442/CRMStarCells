//
//  EPSwipeCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/26/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EPSWipeCellDelegate <NSObject>

- (void)leftButtonTappedWithIndex:(NSInteger)index;

- (void)rightButtonTappedWithIndex:(NSInteger)index;

@end

@interface EPSwipeCell : UITableViewCell

@property (weak) id <EPSWipeCellDelegate> delegate;

@property BOOL righButtonViewOpen;

@property BOOL leftButtonViewOpen;

@property (nonatomic) NSInteger numberOfRightButtons;

@property  (nonatomic) NSInteger numberOfLeftButtons;

+ (CGFloat)cellHeight;

@end
