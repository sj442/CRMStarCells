//
//  NSString+EP.h
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (EP)

- (CGFloat)heightForTextHavingWidth:(CGFloat)width font:(UIFont *)font;
- (CGFloat)heightForTextHavingWidth:(CGFloat)width font:(UIFont *)font maxLines:(CGFloat)maxLines;

@end
