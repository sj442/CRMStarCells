//
//  UiMessageLabel.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPMessageLabel.h"

@implementation EPMessageLabel

- (void)drawTextInRect:(CGRect)rect
{
  UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 10, 10);
  [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
