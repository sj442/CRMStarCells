//
//  EPSwipeCellTableViewController.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/26/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPSwipeCellTableViewController.h"

static NSString* EPSWipeCellIdentifier = @"EPSwipeCell";

@interface EPSwipeCellTableViewController ()

@end

@implementation EPSwipeCellTableViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  [self.tableView registerClass:[EPSwipeCell class] forCellReuseIdentifier:EPSWipeCellIdentifier];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 50;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
  EPSwipeCell *cell = (EPSwipeCell *)[tableView cellForRowAtIndexPath:indexPath];
  if (cell.leftButtonViewOpen || cell.righButtonViewOpen) {
    return NO;
  }
  return NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EPSwipeCell *cell = [tableView dequeueReusableCellWithIdentifier:EPSWipeCellIdentifier];
  if (!cell) {
    cell = [[EPSwipeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPSWipeCellIdentifier];
  }
  cell.delegate = self;
  cell.numberOfLeftButtons = 3;
  cell.numberOfRightButtons = 4;
  [cell resetButtonViews];
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 80;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - EPSwipeCell Delegate

- (void)leftButtonTappedWithIndex:(NSInteger)index
{
  switch (index) {
    case 0:
      NSLog(@"left button 1 tapped");
      break;
    case 1:
      NSLog(@"left button 2 tapped");
      break;
    case 2:
      NSLog(@"left button 3 tapped");
      break;
  }
}

- (void)rightButtonTappedWithIndex:(NSInteger)index
{
  switch (index) {
    case 0:
      NSLog(@"right button 1 tapped");
      break;
    case 1:
      NSLog(@"right button 2 tapped");
      break;
    case 2:
      NSLog(@"right button 3 tapped");
      break;
  }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
  NSArray *visibleCells = self.tableView.visibleCells;
  for (EPSwipeCell *cell in visibleCells) {
    if (!cell.leftButtonViewOpen && !cell.righButtonViewOpen) {
      cell.panGesture.enabled = NO;
    }
  }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
  NSArray *visibleCells = self.tableView.visibleCells;
  for (EPSwipeCell *cell in visibleCells) {
    cell.panGesture.enabled = YES;
  }

}

@end
