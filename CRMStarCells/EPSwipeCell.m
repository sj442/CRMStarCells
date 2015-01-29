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

@property (strong, nonatomic) UITapGestureRecognizer *leftTapGesture;

@property (weak, nonatomic) UIView *myContentView;

@property (weak, nonatomic) UIView *rightButtonView;

@property (weak, nonatomic) UIView *leftButtonView;

@property CGPoint startPoint;

@property CGFloat totalDistance;

@property CGFloat rightButtonWidth;

@property CGFloat leftButtonWidth;

@property CGFloat cellHeight;

@property CGFloat cellWidth;

@property BOOL cellContentsDrawn;

@end

@implementation EPSwipeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
  }
  return  self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  self.cellHeight = CGRectGetHeight(self.contentView.frame);
  self.cellWidth = CGRectGetWidth(self.contentView.frame);
  [self setupButtons];
  [self setupGestureRecognizer];
}

- (void)setupButtons
{
  if (!self.cellContentsDrawn) {
    NSArray *rightColors = @[[UIColor orangeColor], [UIColor yellowColor], [UIColor grayColor]];
    NSArray *rightTitles = @[@"More", @"Flag", @"Archive"];
    self.leftButtonWidth = 80*self.numberOfLeftButtons;
    self.rightButtonWidth = 80*self.numberOfRightButtons;
    UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(self.cellWidth-self.rightButtonWidth, 0, self.rightButtonWidth, self.cellHeight)];
    [self.contentView addSubview:buttonView];
    self.rightButtonView = buttonView;
    
    UIView *leftButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.leftButtonWidth, self.cellHeight)];
    [self.contentView addSubview:leftButtonView];
    self.leftButtonView = leftButtonView;
    
    UIView *myContentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.cellWidth, self.cellHeight)];
    [self.contentView addSubview:myContentView];
    [self.contentView bringSubviewToFront:myContentView];
    self.myContentView = myContentView;
    
    for (int i = 0; i<self.numberOfRightButtons; i++) {
      UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(80*i, 0, 80, self.cellHeight)];
      [button setTitle:rightTitles[i] forState:UIControlStateNormal];
      button.backgroundColor = rightColors[i];
      button.tag = 100+i;
      [self.rightButtonView addSubview:button];
      [button addTarget:self action:@selector(rightButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    for (int i = 0; i<self.numberOfLeftButtons; i++) {
      UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(80*i, 0, 80, self.cellHeight)];
      [button setTitle:rightTitles[i] forState:UIControlStateNormal];
      button.backgroundColor = rightColors[i];
      button.tag = 200+i;
      [self.leftButtonView addSubview:button];
      [button addTarget:self action:@selector(leftButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.cellContentsDrawn = YES;
  }
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

- (void)setupGestureRecognizer
{
  UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(swiped:)];
  [self.contentView addGestureRecognizer:pan];
  self.panGesture = pan;
  
  CGRect frame = self.rightButtonView.frame;
  frame.origin.x = self.cellWidth;
  self.rightButtonView.frame = frame;
  
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
    [self.myContentView setCenter:CGPointMake(self.cellWidth/2-self.rightButtonWidth, self.cellHeight/2)];
    [self.rightButtonView setCenter:CGPointMake(self.cellWidth-self.rightButtonWidth/2, self.cellHeight/2)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.rightButtonView viewWithTag:100+i];
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
    [self.myContentView setCenter:CGPointMake(self.cellWidth/2+self.leftButtonWidth, self.cellHeight/2)];
    [self.leftButtonView setCenter:CGPointMake(self.leftButtonWidth/2, self.cellHeight/2)];
    for (int i=0; i<self.numberOfLeftButtons; i++) {
      UIButton *button = (UIButton *)[self.leftButtonView viewWithTag:200+i];
      CGRect frame = button.frame;
      frame.origin.x = i*80;
      frame.size.width = 80;
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
    [self.myContentView setCenter:CGPointMake(self.cellWidth/2, self.cellHeight/2)];
    [self.leftButtonView setCenter:CGPointMake(-self.leftButtonWidth/2, self.cellHeight/2)];
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
    [self.contentView removeGestureRecognizer:self.leftTapGesture];
  }];
}

- (void)didCloseRightButtonView
{
  NSLog(@"did close right button view");
  [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
    [self.myContentView setCenter:CGPointMake(self.cellWidth/2, self.cellHeight/2)];
    [self.rightButtonView setCenter:CGPointMake(self.cellWidth+self.rightButtonWidth/2, self.cellHeight/2)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.rightButtonView viewWithTag:100+i];
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
    [self.myContentView setCenter:CGPointMake(MIN(self.cellWidth+self.leftButtonWidth/2,centerX +distanceMoved), self.cellHeight/2)];
    NSLog(@"my contentview center x %f", self.myContentView.center.x);
    [self.leftButtonView setCenter:CGPointMake(MIN(self.leftButtonWidth/2, self.leftButtonView.center.x + distanceMoved), self.cellHeight/2)];
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
    [self.myContentView setCenter:CGPointMake(MAX(self.cellWidth/2,centerX +distanceMoved), self.cellHeight/2)];
    [self.leftButtonView setCenter:CGPointMake(MAX(-self.leftButtonWidth/2, self.leftButtonView.center.x + distanceMoved), self.cellHeight/2)];
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
    [self.myContentView setCenter:CGPointMake(MAX(-self.rightButtonWidth/self.numberOfRightButtons,centerX +distanceMoved), self.cellHeight/2)];
    [self.rightButtonView setCenter:CGPointMake(MAX(self.cellWidth-self.rightButtonWidth/2, self.rightButtonView.center.x + distanceMoved), self.cellHeight/2)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.rightButtonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = (self.cellWidth - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons*i;
      frame.size.width = (self.cellWidth - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons;
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
    [self.myContentView setCenter:CGPointMake(MIN(self.cellWidth/2,centerX +distanceMoved), self.cellHeight/2)];
    [self.rightButtonView setCenter:CGPointMake(MIN(self.cellWidth+self.rightButtonWidth/2, self.rightButtonView.center.x + distanceMoved), self.cellHeight/2)];
    for (int i=0; i<self.numberOfRightButtons; i++) {
      UIButton *button = (UIButton *)[self.rightButtonView viewWithTag:100+i];
      CGRect frame = button.frame;
      frame.origin.x = (self.cellWidth - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons*i;
      frame.size.width = (self.cellWidth - CGRectGetMaxX(self.myContentView.frame))/self.numberOfRightButtons;
      button.frame = frame;
    }
  } completion:^(BOOL finished) {
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

@end
