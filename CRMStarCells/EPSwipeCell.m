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

@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;

@property (weak, nonatomic) UIView *myContentView;

@property (weak, nonatomic) UIView *buttonView;

@property (weak, nonatomic) UIView *leftButtonView;

@property CGPoint startPoint;

@property CGFloat totalDistance;

@property CGFloat rightButtonWidth;

@property CGFloat leftButtonWidth;

@property CGFloat cellHeight;

@end

@implementation EPSwipeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    [self setupButtons];
    [self setupGestureRecognizer];
  }
  return  self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
}

- (void)setupButtons
{
  NSArray *rightColors = @[[UIColor orangeColor], [UIColor yellowColor], [UIColor grayColor]];
  NSArray *rightTitles = @[@"More", @"Flag", @"Archive"];
  self.numberOfLeftButtons = 2;
  self.numberOfRightButtons = 2;
  self.leftButtonWidth = 80*self.numberOfLeftButtons;
  self.rightButtonWidth = 80*self.numberOfRightButtons;
  UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(320-self.rightButtonWidth, 0, self.rightButtonWidth, 100)];
  [self.contentView addSubview:buttonView];
  self.buttonView = buttonView;
  self.buttonView.backgroundColor = [UIColor blackColor];
  
  UIView *leftButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.leftButtonWidth, 100)];
  leftButtonView.backgroundColor = [UIColor blueColor];
  [self.contentView addSubview:leftButtonView];
  self.leftButtonView = leftButtonView;
  
  UIView *myContentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
  myContentView.backgroundColor = [UIColor redColor];
  [self.contentView addSubview:myContentView];
  [self.contentView bringSubviewToFront:myContentView];
  self.myContentView = myContentView;
  
  for (int i = 0; i<self.numberOfRightButtons; i++) {
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(80*i, 0, 80, 100)];
    [button setTitle:rightTitles[i] forState:UIControlStateNormal];
    button.backgroundColor = rightColors[i];
    button.tag = 100+i;
    [self.buttonView addSubview:button];
    [button addTarget:self action:@selector(rightButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
  }
  
  for (int i = 0; i<self.numberOfLeftButtons; i++) {
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(80*i, 0, 80, 100)];
    [button setTitle:rightTitles[i] forState:UIControlStateNormal];
    button.backgroundColor = rightColors[i];
    button.tag = 200+i;
    [self.leftButtonView addSubview:button];
    [button addTarget:self action:@selector(leftButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
  }

  
}

- (void)rightButtonTapped:(id)sender
{
  
}

- (void)leftButtonTapped:(id)sender
{
  
}

- (void)setupGestureRecognizer
{
  UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(swiped:)];
  [self.contentView addGestureRecognizer:pan];
  self.panGesture = pan;
  
  CGRect frame = self.buttonView.frame;
  frame.origin.x = 320;
  self.buttonView.frame = frame;
  
  frame = self.leftButtonView.frame;
  frame.origin.x = -80*self.numberOfLeftButtons;
  self.leftButtonView.frame =frame;
}

- (void)swiped:(UIPanGestureRecognizer *)pan
{
  if (pan.state == UIGestureRecognizerStateBegan) {
    CGPoint startPoint = [pan locationInView:self.myContentView];
    self.startPoint = startPoint;
    self.totalDistance = 0;
  }
  if (pan.state == UIGestureRecognizerStateChanged) {
    CGPoint translatedPoint = [pan locationInView:self.myContentView];
    CGFloat distanceMoved = (translatedPoint.x-self.startPoint.x);
    if ((self.totalDistance>=0 && distanceMoved>=0) || (self.totalDistance<=0 && distanceMoved<=0)) {
      self.totalDistance += distanceMoved;
    } else {
      self.totalDistance = 0;
      self.totalDistance +=distanceMoved;
    }
    if (self.totalDistance>0) { //right swipe
      if (self.righButtonViewOpen) {
        [self willCloseRightButtonViewByDistance:distanceMoved];
      } else {
        [self willOpenLeftButtonViewByDistance:distanceMoved];
      }
    } else { //left swipe
      if (self.leftButtonViewOpen) {
        [self willCloseLeftButtonViewByDistance:distanceMoved];
      } else {
        [self willOpenRightButtonViewByDistance:distanceMoved];
      }
    }
  }
  if (pan.state == UIGestureRecognizerStateEnded) {
    CGFloat velocityX = [pan velocityInView:self.myContentView].x;
    if (velocityX>=0) {//moving right
      if (self.righButtonViewOpen) {
        [self didCloseRightButtonView];
      } else {
        [self didOpenLeftButtonView];
      }
    } else { //moving left
      if (self.leftButtonViewOpen) {
        [self didCloseLeftButtonView];
      } else {
        [self didOpenRightButtonView];

      }
    }
  }
}

- (void)didOpenRightButtonView
{
  [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
    [self.myContentView setCenter:CGPointMake(160-self.rightButtonWidth, 50)];
    [self.buttonView setCenter:CGPointMake(320-self.rightButtonWidth/2, 50)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.buttonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = i*80;
      frame.size.width = 80;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeButtonView:)];
    [self.contentView addGestureRecognizer:tap];
    self.tapGesture = tap;
    NSLog(@"did open right button view");
  }];
}

- (void)didOpenLeftButtonView
{
  [UIView animateWithDuration:0.1f animations:^{
    [self.myContentView setCenter:CGPointMake(160+self.leftButtonWidth, 50)];
    [self.leftButtonView setCenter:CGPointMake(self.leftButtonWidth/2, 50)];
    for (int i=0; i<self.numberOfLeftButtons; i++) {
      UIButton *button = (UIButton *)[self.leftButtonView viewWithTag:200+i];
      CGRect frame = button.frame;
      frame.origin.x = i*80;
      frame.size.width = 80;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    NSLog(@"did open left button view");
  }];
}

- (void)didCloseLeftButtonView
{
  [UIView animateWithDuration:0.1f animations:^{
    [self.myContentView setCenter:CGPointMake(160, 50)];
    [self.leftButtonView setCenter:CGPointMake(-self.leftButtonWidth/2, 50)];
    for (int i=0; i<self.numberOfLeftButtons; i++) {
      UIButton *button = (UIButton *)[self.leftButtonView viewWithTag:200+i];
      CGRect frame = button.frame;
      frame.origin.x = i*80;
      frame.size.width = 80;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    self.leftButtonViewOpen = NO;
    NSLog(@"did close left button view");
  }];
}

- (void)didCloseRightButtonView
{
  NSLog(@"did close right button view");
  [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
    [self.myContentView setCenter:CGPointMake(160, 50)];
    [self.buttonView setCenter:CGPointMake(320+self.rightButtonWidth/2, 50)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.buttonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = i*80;
      frame.size.width = 80;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    self.righButtonViewOpen = NO;
    [self.contentView removeGestureRecognizer:self.tapGesture];
  }];
}

- (void)willOpenLeftButtonViewByDistance:(CGFloat)distanceMoved //right swipe, distance moved >0
{
  NSLog(@"will open left button view");
  [UIView animateWithDuration:0.1f animations:^{
    CGFloat centerX = self.myContentView.center.x;
    [self.myContentView setCenter:CGPointMake(MIN(320+self.leftButtonWidth/2,centerX +distanceMoved), 50)];
    NSLog(@"my contentview center x %f", self.myContentView.center.x);
    [self.leftButtonView setCenter:CGPointMake(MIN(self.leftButtonWidth/2, self.leftButtonView.center.x + distanceMoved), 50)];
    NSLog(@"left button view x %f", self.leftButtonView.center.x);
    for (int i=0; i<self.numberOfLeftButtons; i++) {
      UIButton *button = (UIButton *)[self.leftButtonView viewWithTag:200+i];
      CGRect frame = button.frame;
      frame.origin.x = self.leftButtonWidth- CGRectGetMinX(self.myContentView.frame)+CGRectGetMinX(self.myContentView.frame)/self.numberOfLeftButtons*i;
      frame.size.width = CGRectGetMinX(self.myContentView.frame)/self.numberOfLeftButtons;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    self.leftButtonViewOpen = YES;
  }];
}

- (void)willCloseLeftButtonViewByDistance:(CGFloat)distanceMoved //left swipe, distance moved <0
{
  [UIView animateWithDuration:0.1f animations:^{
    CGFloat centerX = self.myContentView.center.x;
    [self.myContentView setCenter:CGPointMake(MAX(160,centerX +distanceMoved), 50)];
    [self.leftButtonView setCenter:CGPointMake(MAX(-self.leftButtonWidth/2, self.leftButtonView.center.x + distanceMoved), 50)];
    for (int i=0; i<self.numberOfLeftButtons; i++) {
      UIButton *button = (UIButton *)[self.leftButtonView viewWithTag:200+i];
      CGRect frame = button.frame;
      frame.origin.x = self.leftButtonWidth- CGRectGetMinX(self.myContentView.frame)+CGRectGetMinX(self.myContentView.frame)/self.numberOfLeftButtons*i;
      frame.size.width = CGRectGetMinX(self.myContentView.frame)/self.numberOfLeftButtons;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    NSLog(@"will close left button view");
  }];
}

- (void)willOpenRightButtonViewByDistance:(CGFloat)distanceMoved
{
  NSLog(@"will open right button view");
  [UIView animateWithDuration:0.1f animations:^{
    CGFloat centerX = self.myContentView.center.x;
    [self.myContentView setCenter:CGPointMake(MAX(-self.rightButtonWidth/self.numberOfRightButtons,centerX +distanceMoved), 50)];
    [self.buttonView setCenter:CGPointMake(MAX(320-self.rightButtonWidth/2, self.buttonView.center.x + distanceMoved), 50)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.buttonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = (320 - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons*i;
      frame.size.width = (320 - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    self.righButtonViewOpen = YES;
  }];
}

- (void)willCloseRightButtonViewByDistance:(CGFloat)distanceMoved
{
  NSLog(@"will close right button view");
  [UIView animateWithDuration:0.1f animations:^{
    CGFloat centerX = self.myContentView.center.x;
    [self.myContentView setCenter:CGPointMake(MIN(160,centerX +distanceMoved), 50)];
    [self.buttonView setCenter:CGPointMake(MIN(320+self.rightButtonWidth/2, self.buttonView.center.x + distanceMoved), 50)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.buttonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = (320 - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons*i;
      frame.size.width = (320 - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
  }];
}

- (void)closeButtonView:(UITapGestureRecognizer *)tap
{
  [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
    [self.myContentView setCenter:CGPointMake(160, 50)];
    [self.buttonView setCenter:CGPointMake(320+self.rightButtonWidth/2, 50)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.buttonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = i*80;
      frame.size.width = 80;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    self.righButtonViewOpen = NO;
    [self.contentView removeGestureRecognizer:self.tapGesture];
  }];
}

@end
