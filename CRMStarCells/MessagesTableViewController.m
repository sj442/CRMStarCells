//
//  MessagesTableViewController.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/20/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "MessagesTableViewController.h"
#import "EPMessageSummaryCell.h"
#import "EPLeftTextMessageCell.h"
#import "NSString+EP.h"
#import "EPLeftTextGroupMessageCell.h"
#import "EPLeftImageMessageCell.h"
#import "EPLeftImageGroupMessageCell.h"
#import "EPRightTextMessageCell.h"

@interface MessagesTableViewController ()

@end

@implementation MessagesTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.tableView registerClass:[EPMessageSummaryCell class] forCellReuseIdentifier:EPMessageSummaryCellIdentifier];
  [self.tableView registerClass:[EPLeftTextMessageCell class] forCellReuseIdentifier:EPLeftTextMessageCellIdentifier];
  [self.tableView registerClass:[EPLeftTextGroupMessageCell class] forCellReuseIdentifier:EPLeftTextGroupMessageCellIdentifier];
  [self.tableView registerClass:[EPLeftImageMessageCell class] forCellReuseIdentifier:EPLeftImageMessageCellIdentifier];
  [self.tableView registerClass:[EPLeftImageGroupMessageCell class] forCellReuseIdentifier:EPLeftImageGroupMessageCellIdentifier];
  [self.tableView registerClass:[EPRightTextMessageCell class] forCellReuseIdentifier:EPRightTextMessageCellIdentifier];
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
  return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.section ==0) {
    EPMessageSummaryCell *cell = [tableView dequeueReusableCellWithIdentifier:EPMessageSummaryCellIdentifier];
    if (!cell) {
      cell = [[EPMessageSummaryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPMessageSummaryCellIdentifier];
    }
    [cell configureWithName:@"Anna Blum" message:@"Hi!dsdkjdaskdhs djhaskj" time:@"Sunday" read:NO];
    return cell;
  } else if (indexPath.section ==1) {
    EPLeftTextMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftTextMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftTextMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftTextMessageCellIdentifier];
    }
    [cell configureWithProfileImage:nil time:@"1:09 PM" message:@"this much I thought proper to tell you kdjfslk sddj dskdln dhsjc dksljc dhsl  dlkdndjk dcsdklcjsdlkcd dchdjlslkch cdskhc"];
    return cell;
  } else if (indexPath.section ==2) {
    EPLeftTextGroupMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftTextGroupMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftTextGroupMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftTextGroupMessageCellIdentifier];
    }
    [cell configureWithName:@"Sunayna Jain" profileImage:nil time:@"12:30 PM" message:@"fmds fsdsdgdfdasfrg ksdfjsdlkn vdljkasl;dxmsl;c sdjas;ldj dljasl;dksc dsjdsl;m jksdl;sdfjdlkjdlkvndkljd"];
    return cell;
  } else if (indexPath.section ==3) {
    EPLeftImageMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftImageMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftImageMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftImageMessageCellIdentifier];
    }
    [cell configureWithProfileImage:nil time:@"1:40 PM" messageImage:[UIImage imageNamed:@"sampleContentImage.jpeg"]];
    return cell;
  } else if (indexPath.section == 4) {
    EPLeftImageGroupMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftImageGroupMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftImageGroupMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftImageGroupMessageCellIdentifier];
    }
    [cell configureWithName:@"Sunayna Jain" profileImage:nil time:@"15:35" messageImage:[UIImage imageNamed:@"sampleContentImage2.jpg"]];
    return cell;
  } else {
    EPRightTextMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPRightTextMessageCellIdentifier];
    if (!cell) {
      cell = [[EPRightTextMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPRightTextMessageCellIdentifier];
    }
    [cell configureWithProfileImage:nil time:@"12:46 PM" message:@"fmds fsdsdgdfdasfrg ksdfjsdlkn vdljkasl;dxmsl;c sdjas;ldj dljasl;dksc dsjdsl;m jksdl;sdfjdlkjdlkvndkljd"];
    return cell;
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.section ==0) {
    return 15+22+9+32+10;
  } else if (indexPath.section ==1) {
    NSString *message = @"this much I thought proper to tell you kdjfslk sddj dskdln dhsjc dksljc dhsl  dlkdndjk dcsdklcjsdlkcd dchdjlslkch cdskhc";
    CGFloat height = [message heightForTextHavingWidth:[EPLeftTextMessageCell messageLabelWidth]-20 font:[UIFont systemFontOfSize:13]];
    return MAX(15+44+5+16+5, 15+height+15+20);
  } else if (indexPath.section ==2) {
    NSString *message = @"fmds fsdsdgdfdasfrg ksdfjsdlkn vdljkasl;dxmsl;c sdjas;ldj dljasl;dksc dsjdsl;m jksdl;sdfjdlkjdlkvndkljd";
    CGFloat height = [message heightForTextHavingWidth:[EPLeftTextMessageCell messageLabelWidth]-20 font:[UIFont systemFontOfSize:13]];
    return MAX(15+44+5+16+5, 5+14+2+height+15+20);
  } else if (indexPath.section == 3){
    return 15+100+15;
  } else {
    return 5+14+2+100+15;
  }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSLog(@"did select %ld", (long)indexPath.row);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 30)];
  UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, CGRectGetWidth(self.tableView.frame), 2)];
  lineView.backgroundColor = [UIColor grayColor];
  [view addSubview:lineView];
  UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.tableView.frame)/2-50, 0, 100, 30)];
  label.font = [UIFont boldSystemFontOfSize:14];
  label.backgroundColor = [UIColor whiteColor];
  label.textAlignment = NSTextAlignmentCenter;
  label.text = @"TODAY";
  label.textColor = [UIColor grayColor];
  [view addSubview:label];
  return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 30;
}
   @end
