//
//  ImageLabelTableViewController.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/19/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "ImageLabelTableViewController.h"
#import "EPUpdateBaseTableViewCell.h"
#import "EPUpdateOpportunityTableviewCell.h"
#import "EPUpdateAccessoryImageTableViewCell.h"
#import "EPUpdateQualifyTableViewCell.h"
#import "EPUpdateNoteTableViewCell.h"
#import "NSString+EP.h"

static NSString* EPUpdateBaseTableViewCellIdentifier = @"EPUpdateBaseTableViewCell";
static NSString* EPUpdateOpportunityTableViewCellIdentifier = @"EPUpdateOpportunityTableViewCell";
static NSString* EPUpdateAccessoryImageTableViewCellIdentifier = @"EPUpdateAccessoryImageTableViewCell";
static NSString* EPUpdateQualifyTableViewCellIdentifier = @"EPUpdateQualifyTableViewCell";
static NSString* EPUpdateNoteTableViewCellIdentifier = @"EPUpdateNoteTableViewCell";

@interface ImageLabelTableViewController ()

@end

@implementation ImageLabelTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.tableView registerClass:[EPUpdateOpportunityTableViewCell class] forCellReuseIdentifier:EPUpdateOpportunityTableViewCellIdentifier];
  [self.tableView registerClass:[EPUpdateAccessoryImageTableViewCell class] forCellReuseIdentifier:EPUpdateAccessoryImageTableViewCellIdentifier];
  [self.tableView registerClass:[EPUPdateQualifyTableViewCell class] forCellReuseIdentifier:EPUpdateQualifyTableViewCellIdentifier];
  [self.tableView registerClass:[EPUpdateNoteTableViewCell class] forCellReuseIdentifier:EPUpdateNoteTableViewCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *title = @"Aaliyah Cramer";
  NSString *time = @"just now";
  NSString *fullText = @"This sounded a very good reason, and Alice was quite pleased to know it. 'I never thought of that before!' she inquisitively said.";
  UIImage *image1 = [UIImage imageNamed:@"sampleContentImage.jpeg"];
  UIImage *image2 = [UIImage imageNamed:@"sampleContentImage2.jpg"];
  if (indexPath.row ==0) {
       EPUpdateNoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPUpdateNoteTableViewCellIdentifier];
    if (!cell) {
      cell = [[EPUpdateNoteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPUpdateNoteTableViewCellIdentifier];
    }
    cell.type = 0;
    cell.primaryLabel.text = title;
    cell.contentLabel.text = fullText;
    cell.timeLabel.text = time;
    cell.contentImageView.image = nil;
    return cell;
  } else if (indexPath.row ==1) {
      EPUpdateNoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPUpdateNoteTableViewCellIdentifier];
      if (!cell) {
        cell = [[EPUpdateNoteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPUpdateNoteTableViewCellIdentifier];
      }
      cell.type = 0;
      cell.primaryLabel.text = title;
      cell.contentLabel.text = nil;
      cell.timeLabel.text = time;
      cell.contentImageView.image = image1;
      return cell;
    } else if (indexPath.row == 2) {
      EPUpdateNoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPUpdateNoteTableViewCellIdentifier];
      if (!cell) {
        cell = [[EPUpdateNoteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPUpdateNoteTableViewCellIdentifier];
      }
      cell.type = 0;
      cell.primaryLabel.text = title;
      cell.contentLabel.text = fullText;
      cell.contentImageView.image = image2;
      cell.timeLabel.text = @"1:43 PM";
      return cell;
    } else if (indexPath.row == 3) {
      EPUpdateOpportunityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPUpdateOpportunityTableViewCellIdentifier];
      if (!cell) {
        cell = [[EPUpdateOpportunityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPUpdateOpportunityTableViewCellIdentifier];
      }
      cell.primaryLabel.text = title;
      cell.nameLabel.text = @"GE Corporate Pilot";
      cell.subNameLabel.text = @"General Electric Corporation";
      cell.descriptionLabel.text = @"Amol Prabarahan, Jeanne Sully";
      cell.accessoryLabel.text = @"$15K";
      cell.timeLabel.text = @"12:46 PM";
      return cell;
    } else if (indexPath.row == 4) {
      EPUPdateQualifyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPUpdateQualifyTableViewCellIdentifier];
      if (!cell) {
        cell = [[EPUPdateQualifyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPUpdateQualifyTableViewCellIdentifier];
      }
      cell.primaryLabel.text= title;
      cell.descriptionLabel.text = @"Qualified Peter Verrillo";
      cell.timeLabel.text = @"1:50 AM";
      [cell setScore:@3.5 maxScore:@4];
      return cell;
    } else if (indexPath.row == 5) {
      EPUpdateAccessoryImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPUpdateAccessoryImageTableViewCellIdentifier];
      if (!cell) {
        cell = [[EPUpdateAccessoryImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPUpdateAccessoryImageTableViewCellIdentifier];
      }
      cell.activityType= 2;
      cell.descriptionLabel.text = @"called Peter Verrillo";
      cell.timeLabel.text = @"1:45 PM";
      cell.primaryLabel.text = @"Jennifer Marino";
      return cell;
    } else if (indexPath.row == 6) {
      EPUpdateAccessoryImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPUpdateAccessoryImageTableViewCellIdentifier];
      if (!cell) {
        cell = [[EPUpdateAccessoryImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPUpdateAccessoryImageTableViewCellIdentifier];
      }
      cell.activityType = 3;
      cell.descriptionLabel.text = @"emailed Peter Verrillo";
      cell.timeLabel.text = @"1:45 PM";
      cell.primaryLabel.text = @"Jennifer Marino";
      return cell;
    } else if (indexPath.row == 7) {
      EPUpdateAccessoryImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPUpdateAccessoryImageTableViewCellIdentifier];
      if (!cell) {
        cell = [[EPUpdateAccessoryImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPUpdateAccessoryImageTableViewCellIdentifier];
      }
      cell.activityType = 4;
      cell.descriptionLabel.text = @"Set Tasks for Peter Verrillo";
      cell.timeLabel.text = @"1:45 PM";
      cell.primaryLabel.text = @"Jennifer Marino";
      return cell;
    } else if (indexPath.row == 8) {
      EPUpdateAccessoryImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPUpdateAccessoryImageTableViewCellIdentifier];
      if (!cell) {
        cell = [[EPUpdateAccessoryImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPUpdateAccessoryImageTableViewCellIdentifier];
      }
      cell.activityType = 5;
      cell.descriptionLabel.text = @"Meeting w/ Peter Verrillo";
      cell.timeLabel.text = @"1:45 PM";
      cell.primaryLabel.text = @"Jennifer Marino";
      return cell;
    } else {
      EPUpdateNoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPUpdateNoteTableViewCellIdentifier];
      if (!cell) {
        cell = [[EPUpdateNoteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPUpdateNoteTableViewCellIdentifier];
      }
      cell.type = 1;
      cell.primaryLabel.text = @"John Brown, Chairman of the Board";
      cell.contentLabel.text = fullText;
      cell.contentImageView.image = nil;
      cell.timeLabel.text = @"1:43 PM";
      return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *fullText = @"This sounded a very good reason, and Alice was quite pleased to know it. 'I never thought of that before!' she inquisitively said.";
  CGFloat height = [fullText heightForTextHavingWidth:[[EPUpdateNoteTableViewCell class] contentLabelWidthInTableViewWithWidth:CGRectGetWidth(self.tableView.frame)] font:[UIFont systemFontOfSize:14] maxLines:4];
  if (indexPath.row == 0) {
    return [[EPUpdateNoteTableViewCell class] recommnendedHeight]+height;
  } else if (indexPath.row ==1) {
    return [[EPUpdateNoteTableViewCell class] recommnendedHeight]+100;
  } else if (indexPath.row ==2) {
    height = [fullText heightForTextHavingWidth:[[EPUpdateNoteTableViewCell class] contentLabelWidthInTableViewWithWidth:CGRectGetWidth(self.tableView.frame)] font:[UIFont systemFontOfSize:14] maxLines:3];
    return [[EPUpdateNoteTableViewCell class] recommnendedHeight]+100+ height+10;
  } else if (indexPath.row ==3) {
    return [[EPUpdateOpportunityTableViewCell class] recommendedHeight];
  } else if (indexPath.row == 4) {
    return [[EPUPdateQualifyTableViewCell class] recommendedHeight];
  } else if (indexPath.row == 5) {
    return [[EPUpdateAccessoryImageTableViewCell class] recommendedHeight];
  } else if (indexPath.row == 6) {
    return [[EPUpdateAccessoryImageTableViewCell class] recommendedHeight];
  } else if (indexPath.row == 7) {
    return [[EPUpdateAccessoryImageTableViewCell class] recommendedHeight];
  } else if (indexPath.row == 8) {
    return [[EPUpdateAccessoryImageTableViewCell class] recommendedHeight];
  } else {
    return [[EPUpdateNoteTableViewCell class] recommnendedHeight]+height;
  }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
