//
//  SwipeScrollViewCell.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/27/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeScrollViewCell : UITableViewCell

@property (weak, nonatomic) UIScrollView *cellScrollView;

@property (weak, nonatomic) UIView *rContainerView;

@property (weak, nonatomic) UIButton *rButton1;

@property (weak, nonatomic) UIButton *rButton2;

@property (weak, nonatomic) UIButton *rButton3;

@property (weak, nonatomic) UIView *lContainerView;

@property (weak, nonatomic) UIButton *lButton1;

@property (weak, nonatomic) UIButton *lButton2;

@property (weak, nonatomic) UIButton *lButton3;

@end
