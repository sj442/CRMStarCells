//
//  EPSwipeCell.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/26/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPSwipeCell.h"

static CGFloat cellHeight = 80.0f;

@interface EPSwipeCell ()

@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;

@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;

@property (strong, nonatomic) UITapGestureRecognizer *leftTapGesture;

@property (weak, nonatomic) UIView *myContentView;

@property (weak, nonatomic) UIView *rightButtonView;

@property (weak, nonatomic) UIView *leftButtonView;

@property CGPoint startPoint;

@property CGFloat totalDistance;

@property CGFloat rightButtonWidth;

@property CGFloat leftButtonWidth;

@property CGFloat buttonWidth;

@property CGFloat cellWidth;

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

+ (CGFloat)cellHeight
{
  return cellHeight;
}

- (void)setNumberOfLeftButtons:(NSInteger)numberOfLeftButtons
{
  if (self.numberOfLeftButtons == numberOfLeftButtons) {
    return;
  }
  _numberOfLeftButtons = numberOfLeftButtons;
  self.leftButtonWidth = self.buttonWidth*numberOfLeftButtons;
  CGRect frame = self.leftButtonView.frame;
  frame.origin.x = -self.buttonWidth*numberOfLeftButtons;
  frame.size.width = self.buttonWidth*numberOfLeftButtons;
  self.leftButtonView.frame =frame;
  
  for (int i = 0; i<_numberOfLeftButtons; i++) {
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.buttonWidth*i, 0,self.buttonWidth, cellHeight)];
    [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];
    button.tag = 200+i;
    button.alpha = (1- 0.15*i);
    [self.leftButtonView addSubview:button];
    [button addTarget:self action:@selector(leftButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
  }
}

- (void)setNumberOfRightButtons:(NSInteger)numberOfRightButtons
{
  if (self.numberOfRightButtons == numberOfRightButtons) {
    return;
  }
  _numberOfRightButtons = numberOfRightButtons;
  self.rightButtonWidth = self.buttonWidth*numberOfRightButtons;
  CGRect frame = self.rightButtonView.frame;
  frame.origin.x = self.cellWidth;
  frame.size.width = self.buttonWidth*numberOfRightButtons;
  self.rightButtonView.frame = frame;
  for (int i = 0; i<self.numberOfRightButtons; i++) {
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.buttonWidth*i, 0, self.buttonWidth, cellHeight)];
    [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.alpha = 1 - 0.15*(self.numberOfRightButtons-i-1);
    button.tag = 100+i;
    [self.rightButtonView addSubview:button];
    [button addTarget:self action:@selector(rightButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
  }
}

- (void)setupButtons
{
  self.cellWidth = [UIScreen mainScreen].bounds.size.width;
  self.buttonWidth = 58;
  
  UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(self.cellWidth-240, 0, 240, cellHeight)];
  [self.contentView addSubview:buttonView];
  self.rightButtonView = buttonView;
  
  UIView *leftButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 240, cellHeight)];
  [self.contentView addSubview:leftButtonView];
  self.leftButtonView = leftButtonView;
  
  UIView *myContentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.cellWidth, cellHeight)];
  [self.contentView addSubview:myContentView];
  [self.contentView bringSubviewToFront:myContentView];
  self.myContentView = myContentView;
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
      if (self.righButtonViewOpen && self.numberOfRightButtons>0) {
        [self willCloseRightButtonViewByDistance:distanceMoved];
      } else if (self.numberOfLeftButtons>0){
        [self willOpenLeftButtonViewByDistance:distanceMoved];
      }
    } else { //left swipe
      if (self.leftButtonViewOpen && self.numberOfLeftButtons>0) {
        [self willCloseLeftButtonViewByDistance:distanceMoved];
      } else if (self.numberOfRightButtons>0) {
        [self willOpenRightButtonViewByDistance:distanceMoved];
      }
    }
  }
  if (pan.state == UIGestureRecognizerStateEnded) {
    CGFloat velocityX = [pan velocityInView:self.myContentView].x;
    if (velocityX>=0) {//moving right
      if (self.righButtonViewOpen && self.numberOfRightButtons>0) {
        [self didCloseRightButtonView];
      } else if (self.numberOfLeftButtons) {
        [self didOpenLeftButtonView];
      }
    } else { //moving left
      if (self.leftButtonViewOpen && self.numberOfLeftButtons >0) {
        [self didCloseLeftButtonView];
      } else if (self.numberOfRightButtons>0){
        [self didOpenRightButtonView];
      }
    }
  }
}

- (void)didOpenRightButtonView
{
  [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
    [self.myContentView setCenter:CGPointMake(self.cellWidth/2-self.rightButtonWidth, cellHeight/2)];
    [self.rightButtonView setCenter:CGPointMake(self.cellWidth-self.rightButtonWidth/2, cellHeight/2)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.rightButtonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = i*self.buttonWidth;
      frame.size.width = self.buttonWidth;
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
    [self.myContentView setCenter:CGPointMake(self.cellWidth/2+self.leftButtonWidth, cellHeight/2)];
    [self.leftButtonView setCenter:CGPointMake(self.leftButtonWidth/2, cellHeight/2)];
    for (int i=0; i<self.numberOfLeftButtons; i++) {
      UIButton *button = (UIButton *)[self.leftButtonView viewWithTag:200+i];
      CGRect frame = button.frame;
      frame.origin.x = i*self.buttonWidth;
      frame.size.width = self.buttonWidth;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeLeftButtonView:)];
    [self.contentView addGestureRecognizer:tap];
    self.leftTapGesture = tap;
    NSLog(@"did open left button view");
  }];
}

- (void)didCloseLeftButtonView
{
  [UIView animateWithDuration:0.1f animations:^{
    [self.myContentView setCenter:CGPointMake(self.cellWidth/2, cellHeight/2)];
    [self.leftButtonView setCenter:CGPointMake(-self.leftButtonWidth/2, cellHeight/2)];
    for (int i=0; i<self.numberOfLeftButtons; i++) {
      UIButton *button = (UIButton *)[self.leftButtonView viewWithTag:200+i];
      CGRect frame = button.frame;
      frame.origin.x = i*self.buttonWidth;
      frame.size.width = self.buttonWidth;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    self.leftButtonViewOpen = NO;
    NSLog(@"did close left button view");
    [self.contentView removeGestureRecognizer:self.leftTapGesture];
  }];
}

- (void)didCloseRightButtonView
{
  [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
    [self.myContentView setCenter:CGPointMake(self.cellWidth/2, cellHeight/2)];
    [self.rightButtonView setCenter:CGPointMake(self.cellWidth+self.rightButtonWidth/2, cellHeight/2)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.rightButtonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = i*self.buttonWidth;
      frame.size.width = self.buttonWidth;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    self.righButtonViewOpen = NO;
    [self.contentView removeGestureRecognizer:self.tapGesture];
    NSLog(@"did close right button view");
  }];
}

- (void)willOpenLeftButtonViewByDistance:(CGFloat)distanceMoved //right swipe, distance moved >0
{
  [UIView animateWithDuration:0.1f animations:^{
    CGFloat centerX = self.myContentView.center.x;
    [self.myContentView setCenter:CGPointMake(MIN(self.cellWidth+self.leftButtonWidth/2,centerX +distanceMoved), cellHeight/2)];
    [self.leftButtonView setCenter:CGPointMake(MIN(self.leftButtonWidth/2, self.leftButtonView.center.x + distanceMoved), cellHeight/2)];
    for (int i=0; i<self.numberOfLeftButtons; i++) {
      UIButton *button = (UIButton *)[self.leftButtonView viewWithTag:200+i];
      CGRect frame = button.frame;
      frame.origin.x = self.leftButtonWidth- CGRectGetMinX(self.myContentView.frame)+CGRectGetMinX(self.myContentView.frame)/self.numberOfLeftButtons*i;
      frame.size.width = CGRectGetMinX(self.myContentView.frame)/self.numberOfLeftButtons;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    self.leftButtonViewOpen = YES;
    NSLog(@"will open left button view");
  }];
}

- (void)willCloseLeftButtonViewByDistance:(CGFloat)distanceMoved //left swipe, distance moved <0
{
  [UIView animateWithDuration:0.1f animations:^{
    CGFloat centerX = self.myContentView.center.x;
    [self.myContentView setCenter:CGPointMake(MAX(self.cellWidth/2,centerX +distanceMoved), cellHeight/2)];
    [self.leftButtonView setCenter:CGPointMake(MAX(-self.leftButtonWidth/2, self.leftButtonView.center.x + distanceMoved), cellHeight/2)];
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
  [UIView animateWithDuration:0.1f animations:^{
    CGFloat centerX = self.myContentView.center.x;
    [self.myContentView setCenter:CGPointMake(MAX(-self.rightButtonWidth/self.numberOfRightButtons,centerX +distanceMoved), cellHeight/2)];
    [self.rightButtonView setCenter:CGPointMake(MAX(self.cellWidth-self.rightButtonWidth/2, self.rightButtonView.center.x + distanceMoved), cellHeight/2)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.rightButtonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = (self.cellWidth - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons*i;
      NSLog(@"button %d origin x %f", i, frame.origin.x);
      frame.size.width = (self.cellWidth - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons;
      NSLog(@"button %d width x %f", i, frame.size.width);
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    self.righButtonViewOpen = YES;
    NSLog(@"will open right button view");
  }];
}

- (void)willCloseRightButtonViewByDistance:(CGFloat)distanceMoved
{
  [UIView animateWithDuration:0.1f animations:^{
    CGFloat centerX = self.myContentView.center.x;
    [self.myContentView setCenter:CGPointMake(MIN(self.cellWidth/2,centerX +distanceMoved), cellHeight/2)];
    [self.rightButtonView setCenter:CGPointMake(MIN(self.cellWidth+self.rightButtonWidth/2, self.rightButtonView.center.x + distanceMoved), cellHeight/2)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.rightButtonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = (self.cellWidth - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons*i;
      frame.size.width = (self.cellWidth - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
    NSLog(@"will close right button view");
  }];
}

- (void)closeLeftButtonView:(UITapGestureRecognizer *)tap
{
  [self didCloseLeftButtonView];
}

- (void)closeButtonView:(UITapGestureRecognizer *)tap
{
  [self didCloseRightButtonView];
}

- (void)rightButtonTapped:(id)sender
{
  UIButton *button = (UIButton*)sender;
  [self.delegate rightButtonTappedWithIndex:button.tag -100];
}

- (void)leftButtonTapped:(id)sender
{
  UIButton *button = (UIButton*)sender;
  [self.delegate leftButtonTappedWithIndex:button.tag-200];
}

@end
