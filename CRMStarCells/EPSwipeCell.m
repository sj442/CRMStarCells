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

@property (weak, nonatomic) UIView *containerView;

@property (weak, nonatomic) UIView *myContentView;

@property (weak, nonatomic) UIView *buttonView;

@property (weak, nonatomic) UIButton *button1;

@property (weak, nonatomic) UIButton *button2;

@property (weak, nonatomic) UIButton *button3;

@property (weak, nonatomic) UIView *leftButtonView;

@property CGPoint startPoint;

@property BOOL rightViewWillOpen;

@property BOOL rightViewWillClose;

@property BOOL leftViewWillOpen;

@property BOOL leftViewWillClose;

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
  UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(80, 0, 240, 100)];
  [self.contentView addSubview:buttonView];
  self.buttonView = buttonView;
  self.buttonView.backgroundColor = [UIColor blackColor];
  
  UIView *leftButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 240, 100)];
  leftButtonView.backgroundColor = [UIColor blueColor];
  [self.contentView addSubview:leftButtonView];
  self.leftButtonView = leftButtonView;
  
  UIView *myContentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
  myContentView.backgroundColor = [UIColor redColor];
  [self.contentView addSubview:myContentView];
  [self.contentView bringSubviewToFront:myContentView];
  self.myContentView = myContentView;
  
  UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.buttonView.frame)/3, 100)];
  button1.backgroundColor = [UIColor orangeColor];
  [button1 setTitle:@"More" forState:UIControlStateNormal];
  [self.buttonView addSubview:button1];
  [button1 addTarget:self action:@selector(button1Tapped:) forControlEvents:UIControlEventTouchUpInside];
  self.button1 = button1;
  
  UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.button1.frame), 0, CGRectGetWidth(self.buttonView.frame)/3, 100)];
  [self.buttonView addSubview:button2];
  [button2 setTitle:@"Flag" forState:UIControlStateNormal];
  button2.backgroundColor = [UIColor yellowColor];
  [button2 addTarget:self action:@selector(button2Tapped:) forControlEvents:UIControlEventTouchUpInside];
  self.button2 = button2;
  
  UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.button2.frame), 0, CGRectGetWidth(self.buttonView.frame)/3, 100)];
  button3.backgroundColor = [UIColor grayColor];
  [button3 setTitle:@"Archive" forState:UIControlStateNormal];
  [self.buttonView addSubview:button3];
  [button3 addTarget:self action:@selector(button3Tapped:) forControlEvents:UIControlEventTouchUpInside];
  self.button3 = button3;
}

- (void)button1Tapped:(id)sender
{
  NSLog(@"button 1 tapped");
}

- (void)button2Tapped:(id)sender
{
  NSLog(@"button 2 tapped");
}

- (void)button3Tapped:(id)sender
{
  NSLog(@"button 3 tapped");
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
    self.rightViewWillClose = NO;
    self.rightViewWillOpen = NO;
    self.leftViewWillOpen = NO;
    self.leftViewWillClose = NO;
  }
  if (pan.state == UIGestureRecognizerStateChanged) {
    CGPoint translatedPoint = [pan locationInView:self.myContentView];
    CGFloat distanceMoved = (translatedPoint.x-self.startPoint.x);
    [UIView animateWithDuration:0.1f animations:^{
      if (distanceMoved>0) //right swipe
      {
        if (self.rightViewWillClose || self.righButtonViewOpen) {
          self.rightViewWillClose = YES;
          self.leftViewWillClose = NO;
          self.leftViewWillOpen = NO;
          self.rightViewWillOpen = NO;
          //close right button view
          self.leftButtonView.hidden = YES;
          self.buttonView.hidden = NO;
          CGFloat centerX = self.myContentView.center.x;
          [self.myContentView setCenter:CGPointMake(MIN(160,centerX +distanceMoved), 50)];
          [self.buttonView setCenter:CGPointMake(MIN(440, self.buttonView.center.x + distanceMoved), 50)];
          CGRect frame = self.button1.frame;
          frame.origin.x = 0;
          frame.size.width = (320 - CGRectGetMaxX(self.myContentView.frame))/3;
          self.button1.frame =frame;
          frame =self.button2.frame;
          frame.origin.x = CGRectGetMaxX(self.button1.frame);
          frame.size.width = (320 - CGRectGetMaxX(self.myContentView.frame))/3;
          self.button2.frame = frame;
          frame = self.button3.frame;
          frame.origin.x = CGRectGetMaxX(self.button2.frame);
          frame.size.width = (320 - CGRectGetMaxX(self.myContentView.frame))/3;
          self.button3.frame = frame;

        } else {
          //open left button view
          self.leftViewWillOpen = YES;
          self.rightViewWillClose = NO;
          self.leftViewWillClose = NO;
          self.rightViewWillOpen = NO;
          self.leftButtonView.hidden = NO;
          self.buttonView.hidden = YES;
        }
        
      } else { //left swipe
        if (self.leftButtonViewOpen || self.leftViewWillClose) {
          //close left button view
          self.leftButtonView.hidden = NO;
          self.buttonView.hidden = YES;
          self.leftViewWillClose = YES;
          self.rightViewWillOpen = NO;
          self.leftViewWillOpen = NO;
          self.rightViewWillClose = NO;
        } else {
          //open right button view
          self.leftButtonView.hidden = YES;
          self.buttonView.hidden = NO;
          self.rightViewWillOpen = YES;
          self.leftViewWillClose = NO;
          self.rightViewWillClose = NO;
          self.leftViewWillOpen = NO;
          CGFloat centerX = self.myContentView.center.x;
          [self.myContentView setCenter:CGPointMake(MAX(-80,centerX +distanceMoved), 50)];
          [self.buttonView setCenter:CGPointMake(MAX(200, self.buttonView.center.x + distanceMoved), 50)];
          CGFloat xOrigin;
          if (self.buttonView.center.x <=200) {
            CGFloat buttonWidthVisible = 320 - CGRectGetMaxX(self.myContentView.frame);
            xOrigin = 240- buttonWidthVisible;
          } else {
            xOrigin = 0;
          }
          CGRect frame = self.button1.frame;
          frame.origin.x = xOrigin;
          frame.size.width = (320 - CGRectGetMaxX(self.myContentView.frame))/3;
          self.button1.frame = frame;
          frame =self.button2.frame;
          frame.origin.x = CGRectGetMaxX(self.button1.frame);
          frame.size.width = (320 - CGRectGetMaxX(self.myContentView.frame))/3;
          self.button2.frame = frame;
          frame = self.button3.frame;
          frame.origin.x = CGRectGetMaxX(self.button2.frame);
          frame.size.width = (320 - CGRectGetMaxX(self.myContentView.frame))/3;
          self.button3.frame = frame;
        }
      }
    } completion:^(BOOL finished) {
    }];
  }
  if (pan.state == UIGestureRecognizerStateEnded) {
    CGFloat velocityX = [pan velocityInView:self.contentView].x;
    if (velocityX>0 && self.rightViewWillClose && !self.leftViewWillOpen) {//moving right
      [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.myContentView setCenter:CGPointMake(160, 50)];
        [self.buttonView setCenter:CGPointMake(440, 50)];
        CGRect frame = self.button1.frame;
        frame.origin.x = 0;
        frame.size.width = 80;
        self.button1.frame =frame;
        frame =self.button2.frame;
        frame.origin.x = CGRectGetMaxX(self.button1.frame);
        frame.size.width = 80;
        self.button2.frame = frame;
        frame = self.button3.frame;
        frame.origin.x = CGRectGetMaxX(self.button2.frame);
        frame.size.width = 80;
        self.button3.frame = frame;
      } completion:^(BOOL finished) {
        self.righButtonViewOpen = NO;
        [self.contentView removeGestureRecognizer:self.tapGesture];
      }];
    } else if (velocityX>0 && self.rightViewWillClose && !self.leftViewWillOpen ){
      
    } else if (velocityX<0 && self.leftViewWillClose && !self.rightViewWillOpen){
      
    } else if (velocityX<0 && self.rightViewWillOpen && !self.leftViewWillClose) { //moving left
      [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.myContentView setCenter:CGPointMake(-80, 50)];
        [self.buttonView setCenter:CGPointMake(200, 50)];
        CGRect frame = self.button1.frame;
        frame.origin.x = 0;
        frame.size.width = 80;
        self.button1.frame =frame;
        frame =self.button2.frame;
        frame.origin.x = CGRectGetMaxX(self.button1.frame);
        frame.size.width = 80;
        self.button2.frame = frame;
        frame = self.button3.frame;
        frame.origin.x = CGRectGetMaxX(self.button2.frame);
        frame.size.width = 80;
        self.button3.frame = frame;
      } completion:^(BOOL finished) {
        self.righButtonViewOpen = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeButtonView:)];
        [self.contentView addGestureRecognizer:tap];
        self.tapGesture = tap;
      }];
    }
  }
}

- (void)closeButtonView:(UITapGestureRecognizer *)tap
{
  [UIView animateWithDuration:0.1f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
    [self.myContentView setCenter:CGPointMake(160, 50)];
    [self.buttonView setCenter:CGPointMake(440, 50)];
    CGRect frame = self.button1.frame;
    frame.origin.x = 0;
    frame.size.width = 80;
    self.button1.frame =frame;
    frame =self.button2.frame;
    frame.origin.x = CGRectGetMaxX(self.button1.frame);
    frame.size.width = 80;
    self.button2.frame = frame;
    frame = self.button3.frame;
    frame.origin.x = CGRectGetMaxX(self.button2.frame);
    frame.size.width = 80;
    self.button3.frame = frame;
  } completion:^(BOOL finished) {
    self.righButtonViewOpen = NO;
    [self.contentView removeGestureRecognizer:self.tapGesture];
  }];
}

@end
