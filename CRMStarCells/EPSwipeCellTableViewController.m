//
//  EPSwipeCellTableViewController.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/26/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPSwipeCellTableViewController.h"
#import "SwipeScrollViewCell.h"
#import "EPSwipeCell.h"

static NSString* EPSWipeCellIdentifier = @"EPSwipeCell";
static NSString* SwipeScrollViewCellIdentifier = @"SwipeScrollViewCell";

@interface EPSwipeCellTableViewController ()

@end

@implementation EPSwipeCellTableViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  [self.tableView registerClass:[EPSwipeCell class] forCellReuseIdentifier:EPSWipeCellIdentifier];
  
  [self.tableView registerClass:[SwipeScrollViewCell class] forCellReuseIdentifier:SwipeScrollViewCellIdentifier];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  
  CGRect frame = self.tableView.frame;
  frame.origin.x = 0;
  frame.origin.y = 0;
  frame.size.width = 560;
  frame.size.height = self.view.frame.size.height;
  self.tableView.frame = frame;
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
    return 3;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
  EPSwipeCell *cell = (EPSwipeCell *)[tableView cellForRowAtIndexPath:indexPath];
  if (cell.buttonViewOpen) {
    return NO;
  }
  return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EPSwipeCell *cell = [tableView dequeueReusableCellWithIdentifier:EPSWipeCellIdentifier];
  if (!cell) {
    cell = [[EPSwipeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPSWipeCellIdentifier];
  }
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 100;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
  
}

@end
