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
#import "EPImageLabelActivityLabelCell.h"
#import "NSString+EP.h"

@interface ImageLabelTableViewController ()

@end

@implementation ImageLabelTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.tableView registerClass:[EPImageLabelCell class] forCellReuseIdentifier:EPImageLabelCellIdentifier];
  [self.tableView registerClass:[EPTitleTextImageCell class] forCellReuseIdentifier:EPTitleTextImageCellIdentifier];
  [self.tableView registerClass:[EPImageLabelAccessoryViewCell class] forCellReuseIdentifier:EPImageLabelAccessoryViewCellIdentifier];
  [self.tableView registerClass:[EPImageLabelActivityLabelCell class] forCellReuseIdentifier:EPImageLabelActivityLabelCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 5;
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
    NSString *fullText = @"This sounded a very good reason, and Alice was quite pleased to know it. sdhds nbcsad shskdjh dashjdsa sdkhsjdfkhds dshdsdhdskl dcsdsv djhsdskjh sdfsdf dfsd dfsdsd vdfd kvjdklfjs";
    [cell configureWithTitle:title contentText:fullText contentImage:nil time:time];
    return cell;
  } else if (indexPath.section ==3) {
    EPImageLabelAccessoryViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:EPImageLabelAccessoryViewCellIdentifier];
    if (!cell) {
      cell = [[EPImageLabelAccessoryViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPImageLabelAccessoryViewCellIdentifier];
    }
    NSString *title = @"Aaliyah Cramer";
    [cell configureWithTitle:title subTitle:@"GE Corporate Pilot" descriptionText:@"This sounded a very good reason, and Alice was quite pleased to know it. 'I never thought of that before!' She inquisitively said." accessoryText:@"$15K"];
    return cell;
  } else {
    EPImageLabelActivityLabelCell *cell = [self.tableView dequeueReusableCellWithIdentifier:EPImageLabelActivityLabelCellIdentifier];
    if (!cell) {
      cell = [[EPImageLabelActivityLabelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPImageLabelActivityLabelCellIdentifier];
    }
    NSString *title = @"Aaliyah Cramer";
    [cell configureWithTitle:title activityText:@"Qualified Peter Verrillo" score:@3.5 OutOf:@"out of 4"];
    return cell;
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.section ==0) {
    return (17+18+11)+100+ (14+18) ;
  } else if (indexPath.section == 1) {
    NSString *fullText = @"This sounded a very good reason, and Alice was quite pleased to know it. 'I never thought of that before!' She inquisitively said.";
    CGFloat height = [fullText heightForTextHavingWidth:[EPTitleTextImageCell contentLabelWidth] font:[UIFont systemFontOfSize:14] maxLines:3];
    return (17+18+11)+11+100+ (14+18) +height;
  } else if (indexPath.section ==2) {
    NSString *fullText = @"This sounded a very good reason, and Alice was quite pleased to know it. sdhds nbcsad shskdjh dashjdsa sdkhsjdfkhds dshdsdhdskl dcsdsv djhsdskjh sdfsdf dfsd dfsdsd vdfd kvjdklfjs";
    CGFloat height = [fullText heightForTextHavingWidth:[EPTitleTextImageCell contentLabelWidth] font:[UIFont systemFontOfSize:14] maxLines:4];
    return (17+18+5) +height+ (14+18);
  } else if (indexPath.section == 3) {
    NSString *text = @"This sounded a very good reason, and Alice was quite pleased to know it. 'I never thought of that before!' She inquisitively said.";
    CGFloat height = [text heightForTextHavingWidth:[EPImageLabelAccessoryViewCell contentLabelWidth] font:[UIFont systemFontOfSize:12] maxLines:2];
    return (17+18+5) + 17+ 3 + height + (14+ 18);
  } else {
    return (18+11+17)+(14+18)+17;
  }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
