//
//  EPSwipeCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/26/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPSwipeCell.h"

@interface EPSwipeCell ()

@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;

@property (weak, nonatomic) UIView *myContentView;

@property (weak, nonatomic) UIButton *button1;

@property (weak, nonatomic) UIButton *button2;

@property (weak, nonatomic) UIButton *button3;

@property CGPoint startPoint;

@end

@implementation EPSwipeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    [self setupRightButtons];
    
    [self setupGestureRecognizer];
  }
  return  self;
}

- (void)setupRightButtons
{
  UIView *myContentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), 100)];
  myContentView.backgroundColor = [UIColor redColor];
  [self.contentView addSubview:myContentView];
  self.myContentView = myContentView;
  UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.myContentView.frame), 0, 80, 100)];
  [button3 setTitle:@"More" forState:UIControlStateNormal];
  button3.backgroundColor = [UIColor orangeColor];
  [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [self.contentView addSubview:button3];
  self.button3 = button3;
  UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.button3.frame)+CGRectGetWidth(self.myContentView.frame), 0, 80, 100)];
  [button2 setTitle:@"Flag" forState:UIControlStateNormal];
  button2.backgroundColor = [UIColor yellowColor];
  [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [self.contentView addSubview:button2];
  self.button2 = button2;
  UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.button2.frame)+CGRectGetWidth(self.button3.frame)+CGRectGetWidth(self.myContentView.frame), 0, 80, 100)];
  [button1 setTitle:@"Archive" forState:UIControlStateNormal];
  button1.backgroundColor = [UIColor grayColor];
  [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [self.contentView addSubview:button1];
  self.button1 = button1;
}

- (void)setupGestureRecognizer
{
  UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(swiped:)];
  [self.contentView addGestureRecognizer:pan];
  self.panGesture = pan;
}

- (void)swiped:(UIPanGestureRecognizer *)pan
{
  if (pan.state == UIGestureRecognizerStateBegan) {
    CGPoint startPoint = [pan locationInView:self.contentView];
    self.startPoint = startPoint;
  }
  if (pan.state == UIGestureRecognizerStateChanged) {
    CGPoint translatedPoint = [pan locationInView:self.contentView];
    CGFloat distanceMoved = abs(translatedPoint.x-self.startPoint.x);
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView animateWithDuration:0.1f animations:^{
      CGFloat centerX = self.contentView.center.x;
      [self.contentView setCenter:CGPointMake(centerX +translatedPoint.x-self.startPoint.x, 50)];
      CGRect frame = self.button3.frame;
      frame.origin.x = self.contentView.frame.origin.x +320;
      frame.origin.y = 0;
      frame.size.width = distanceMoved/3;
      frame.size.height  = 100;
      self.button3.frame = frame;
      frame = self.button2.frame;
      frame.origin.x = self.contentView.frame.origin.x +320+distanceMoved/3;
      frame.origin.y = 0;
      frame.size.width = distanceMoved/3;
      frame.size.height  = 100;
      self.button2.frame = frame;
      frame = self.button1.frame;
      frame.origin.x = self.contentView.frame.origin.x +320+(distanceMoved*2)/3;
      frame.origin.y = 0;
      frame.size.width = distanceMoved/3;
      frame.size.height = 100;
      self.button1.frame = frame;
    } completion:^(BOOL finished) {
    }];
  }
    if (pan.state == UIGestureRecognizerStateEnded) {
      CGFloat velocityX = [pan velocityInView:self.contentView].x;
      if (velocityX>0) {//moving right
        [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
          [self.contentView setCenter:CGPointMake(160, 50)];
          CGRect frame = self.button3.frame;
          frame.origin.x = CGRectGetWidth(self.myContentView.frame);
          frame.size.width = 80;
          self.button3.frame = frame;
          frame = self.button2.frame;
          frame.origin.x = CGRectGetWidth(self.button3.frame)+CGRectGetWidth(self.myContentView.frame);
          frame.size.width = 80;
          self.button2.frame = frame;
          frame = self.button1.frame;
          frame.origin.x = CGRectGetWidth(self.button2.frame)+ CGRectGetWidth(self.button3.frame)+CGRectGetWidth(self.myContentView.frame);
          frame.size.width = 80;
          self.button1.frame = frame;
        } completion:^(BOOL finished) {
        }];
      } else { //moving left
        [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
          [self.contentView setCenter:CGPointMake(-80, 50)];
          CGRect frame = self.button3.frame;
          frame.origin.x = CGRectGetMaxX(self.myContentView.frame);
          frame.size.width = 80;
          self.button3.frame = frame;
          frame = self.button2.frame;
          frame.origin.x = CGRectGetWidth(self.button2.frame)+ CGRectGetWidth(self.button3.frame)+CGRectGetWidth(self.myContentView.frame);
          frame.size.width = 80;
          self.button2.frame = frame;
          frame = self.button1.frame;
          frame.origin.x = CGRectGetMaxX(self.button2.frame);
          frame.size.width = 80;
          self.button1.frame = frame;
        } completion:^(BOOL finished) {
        }];
      }
    }
}

@end
