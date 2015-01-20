//
//  UILabel+Insets.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "UILabel+Insets.h"

@implementation UILabel (Insets)

- (void)drawTextInRect:(CGRect)rect {
  UIEdgeInsets insets = {0, 5, 0, 5};
  [self drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}
@end
