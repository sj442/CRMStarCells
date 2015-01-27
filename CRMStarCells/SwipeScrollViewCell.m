//
//  SwipeScrollViewCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/27/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "SwipeScrollViewCell.h"

@interface SwipeScrollViewCell ()

@property CGPoint startPoint;

@end


@implementation SwipeScrollViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    [self setupScrollView];
    
  }
  return self;
}

-(void)setupScrollView
{
  UIScrollView *sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
  [self.contentView addSubview:sv];
  sv.backgroundColor = [UIColor redColor];
  self.cellScrollView = sv;
  sv.contentSize = CGSizeMake(320+480, 100);
  sv.pagingEnabled = NO;
  sv.scrollEnabled = NO;
  sv.showsHorizontalScrollIndicator = NO;
  NSArray *colors = @[[UIColor yellowColor], [UIColor redColor], [UIColor orangeColor]];
  for (int i=0; i<3; i++) {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(i*240+(i/2)*80, 0, 240+(i%2)*80, 100)];
    view.backgroundColor = colors[i];
    [self.cellScrollView addSubview:view];
    [self.cellScrollView scrollRectToVisible:CGRectMake(240, 0, 320, 100) animated:NO];
  }
  UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(swiped:)];
  [self.cellScrollView addGestureRecognizer:pan];
}

- (void)swiped:(UIPanGestureRecognizer *)pan
{
  if (pan.state == UIGestureRecognizerStateBegan) {
    CGPoint startPoint = [pan locationInView:self.cellScrollView];
    self.startPoint = startPoint;
  }
  if (pan.state == UIGestureRecognizerStateChanged) {
    CGPoint translatedPoint = [pan locationInView:self.cellScrollView];
    CGFloat distanceMoved = (translatedPoint.x-self.startPoint.x);
    NSLog(@"distance moved x %f", distanceMoved);
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView animateWithDuration:0.1f animations:^{
      if (distanceMoved>0) {
        [self.cellScrollView setContentOffset:CGPointMake(560-distanceMoved, 0) animated:NO];
      } else {
        [self.cellScrollView setContentOffset:CGPointMake(240-distanceMoved, 0) animated:NO];
      }
      NSLog(@"content offset x is %f", self.cellScrollView.contentOffset.x);
    } completion:nil];
  }
  if (pan.state == UIGestureRecognizerStateEnded) {
    CGFloat velocityX = [pan velocityInView:self.contentView].x;
    if (velocityX>0) {//moving right
      [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.cellScrollView scrollRectToVisible:CGRectMake(240, 0, 320, 100) animated:YES];
        } completion:nil];
    } else { //moving left
      [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.cellScrollView scrollRectToVisible:CGRectMake(480, 0, 320, 100) animated:YES];
        } completion:^(BOOL finished) {
      }];
    }
  }
}

@end
