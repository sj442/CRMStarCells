//
//  ImageLabelTableViewController.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "ImageLabelTableViewController.h"
#import "EPImageLabelCell.h"
#import "EPTitleTextImageCell.h"
#import "EPImageLabelAccessoryViewCell.h"

@interface ImageLabelTableViewController ()

@end

@implementation ImageLabelTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.tableView registerClass:[EPImageLabelCell class] forCellReuseIdentifier:EPImageLabelCellIdentifier];
  [self.tableView registerClass:[EPTitleTextImageCell class] forCellReuseIdentifier:EPTitleTextImageCellIdentifier];
  [self.tableView registerClass:[EPImageLabelAccessoryViewCell class] forCellReuseIdentifier:EPImageLabelAccessoryViewCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.section ==0) {
  EPTitleTextImageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPTitleTextImageCellIdentifier forIndexPath:indexPath];
  if (!cell) {
    cell = [[EPTitleTextImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPTitleTextImageCellIdentifier];
  }
    NSString *title = @"Aaliyah Cramer";
    NSString *time = @"just now";
    [cell configureWithTitle:title contentText:nil contentImage:[UIImage imageNamed:@"sampleContentImage.jpeg"] time:time];
     return cell;
  } else if (indexPath.section ==1) {
    EPTitleTextImageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPTitleTextImageCellIdentifier];
    NSString *title = @"Aaliyah Cramer";
    NSString *fullText = @"This sounded a very good reason, and Alice was quite pleased to know it. 'I never thought of that before!' She inquisitively said.";
    NSString *time = @"just now";
    if (!cell) {
      cell = [[EPTitleTextImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPTitleTextImageCellIdentifier];
    }
    [cell configureWithTitle:title contentText:fullText contentImage:[UIImage imageNamed:@"sampleContentImage.jpeg"] time:time];
    return cell;
  } else if (indexPath.section ==2){
    EPTitleTextImageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPTitleTextImageCellIdentifier forIndexPath:indexPath];
    if (!cell) {
      cell = [[EPTitleTextImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPTitleTextImageCellIdentifier];
    }
    NSString *title = @"Aaliyah Cramer";
    NSString *time = @"just now";
    NSString *fullText = @"This sounded a very good reason, and Alice was quite pleased to know it. 'I never thought of that before!' She inquisitively said.";
    [cell configureWithTitle:title contentText:fullText contentImage:nil time:time];
    return cell;
  } else {
    EPImageLabelAccessoryViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:EPImageLabelAccessoryViewCellIdentifier];
    if (!cell) {
      cell = [[EPImageLabelAccessoryViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPImageLabelAccessoryViewCellIdentifier];
    }
    NSString *title = @"Aaliyah Cramer";
    [cell configureWithTitle:title subTitle:@"GE Corporate Pilot" descriptionText:@"This sounded a very good reason, and Alice was quite pleased to know it. 'I never thought of that before!' She inquisitively said." accessoryText:@"$15K"];
    return cell;
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.section ==3) {
    return 130;
  }
  return 380;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
