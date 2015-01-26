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
#import "EPRightTextGroupMessageCell.h"
#import "EPRightImageMessageCell.h"
#import "EPRightImageGroupMessageCell.h"

static NSString* EPMessageSummaryCellIdentifier = @"EPMessageSummaryCell";
static NSString* EPLeftTextMessageCellIdentifier = @"EPLeftTextMessageCell";
static NSString *EPLeftTextGroupMessageCellIdentifier = @"EPLeftTextGroupMessageCell";

@interface MessagesTableViewController ()

@end

@implementation MessagesTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.tableView registerClass:[EPMessageSummaryCell class] forCellReuseIdentifier:EPMessageSummaryCellIdentifier];
  [self.tableView registerClass:[EPLeftTextMessageCell class] forCellReuseIdentifier:EPLeftTextMessageCellIdentifier];
  [self.tableView registerClass:[EPLeftTextGroupMessageCell class] forCellReuseIdentifier:EPLeftTextGroupMessageCellIdentifier];
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  if (section ==0) {
    return 1;
  }
  return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.section ==0) {
    EPMessageSummaryCell *cell = [tableView dequeueReusableCellWithIdentifier:EPMessageSummaryCellIdentifier];
    if (!cell) {
      cell = [[EPMessageSummaryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPMessageSummaryCellIdentifier];
    }
    cell.nameLabel.text = @"Anna Blum";
    cell.messageLabel.text = @"fgfd fds gd vdfdv ddsfdg";
    cell.timeLabel.text = @"Sunday";
    cell.dotView.hidden = NO;
    return cell;
  } else if (indexPath.row == 1) {
    EPLeftTextMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftTextMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftTextMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftTextMessageCellIdentifier];
    }
    cell.chatCellType = EPLeftAlignedText;
    cell.profileImageView.image = nil;
    cell.dateLabel.text = @"1:09 PM";
    cell.messageLabel.text = @"this much I thought proper to tell you kdjfslk sddj dskdln dhsjc dksljc dhsl  dlkdndjk dcsdklcjsdlkcd dchdjlslkch cdskhc";
    return cell;
  } else if (indexPath.row ==2) {
    EPLeftTextGroupMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftTextGroupMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftTextGroupMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftTextGroupMessageCellIdentifier];
    }
    cell.profileImageView.image = nil;
    cell.dateLabel.text = @"1:09 PM";
    cell.messageLabel.text = @"this much I thought proper to tell you kdjfslk sddj dskdln dhsjc dksljc dhsl  dlkdndjk dcsdklcjsdlkcd dchdjlslkch cdskhc";
    cell.chatCellType = EPLeftAlignedText;
    cell.nameLabel.text = @"Sunayna Jain";
    return cell;
  } else if (indexPath.row ==3) {
    EPLeftTextMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftTextMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftTextMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftTextMessageCellIdentifier];
    }
    cell.profileImageView.image = nil;
    cell.dateLabel.text = @"1:40 PM";
    cell.messageImageView.image = [UIImage imageNamed:@"sampleContentImage.jpeg"];
    cell.chatCellType = EPLeftAlignedImage;
    return cell;
  } else if (indexPath.row == 4) {
    EPLeftTextGroupMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftTextGroupMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftTextGroupMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftTextGroupMessageCellIdentifier];
    }
    cell.nameLabel.text = @"Sunayna Jain";
    cell.dateLabel.text = @"10:56 AM";
    cell.messageImageView.image = [UIImage imageNamed:@"sampleContentImage2.jpg"];
    cell.chatCellType = EPLeftAlignedImage;
    cell.profileImageView.image = nil;
    return cell;
  } else if (indexPath.row == 5){
    EPLeftTextMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftTextMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftTextMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftTextMessageCellIdentifier];
    }
    cell.chatCellType = EPRightAlignedText;
    cell.profileImageView.image = nil;
    cell.dateLabel.text = @"12:46 PM";
    cell.messageLabel.text = @"this much I thought proper to tell you kdjfslk sddj dskdln dhsjc dksljc dhsl  dlkdndjk dcsdklcjsdlkcd dchdjlslkch cdskhc";
    return cell;
  }
  else if (indexPath.row == 6) {
    EPLeftTextGroupMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftTextGroupMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftTextGroupMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftTextGroupMessageCellIdentifier];
    }
    cell.chatCellType = EPRightAlignedText;
    cell.nameLabel.text = @"Sunayna Jain";
    cell.profileImageView.image = nil;
    cell.dateLabel.text = @"1:55 PM";
    cell.messageLabel.text = @"this much I thought proper to tell you kdjfslk sddj dskdln dhsjc dksljc dhsl  dlkdndjk dcsdklcjsdlkcd dchdjlslkch cdskhc";
    return cell;
  } else if (indexPath.row == 7) {
    EPLeftTextMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftTextMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftTextMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftTextMessageCellIdentifier];
    }
    cell.chatCellType = EPRightAlignedImage;
    cell.profileImageView.image = nil;
    cell.dateLabel.text = @"12:57 PM";
    cell.messageImageView.image = [UIImage imageNamed:@"sampleContentImage2.jpg"];
    return cell;
  } else {
    EPLeftTextGroupMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:EPLeftTextGroupMessageCellIdentifier];
    if (!cell) {
      cell = [[EPLeftTextGroupMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPLeftTextGroupMessageCellIdentifier];
    }
    cell.nameLabel.text = @"Sunayna Jain";
    cell.profileImageView.image = nil;
    cell.dateLabel.text = @"12:35 PM";
    cell.messageImageView.image = [UIImage imageNamed:@"sampleContentImage.jpeg"];
    cell.chatCellType = EPRightAlignedImage;
    return cell;
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.section ==0) {
    return 15+22+9+32+10;
  } else if (indexPath.row ==1 || indexPath.row ==5) {
    NSString *message = @"this much I thought proper to tell you kdjfslk sddj dskdln dhsjc dksljc dhsl  dlkdndjk dcsdklcjsdlkcd dchdjlslkch cdskhc";
    CGFloat height = [message heightForTextHavingWidth:[[EPLeftTextMessageCell class] contentLabelWidthInTableViewWithWidth:CGRectGetWidth(self.tableView.frame)] font:[UIFont systemFontOfSize:13]];
    return MAX(15+44+5+16+5, 15+height+15+20);
  } else if (indexPath.row ==2 || indexPath.row ==6) {
    NSString *message = @"this much I thought proper to tell you kdjfslk sddj dskdln dhsjc dksljc dhsl  dlkdndjk dcsdklcjsdlkcd dchdjlslkch cdskhc";
    CGFloat height = [message heightForTextHavingWidth:[[EPLeftTextMessageCell class] contentLabelWidthInTableViewWithWidth:CGRectGetWidth(self.tableView.frame)] font:[UIFont systemFontOfSize:13]];
    return MAX(15+44+5+16+5, 5+14+2+height+15+20);
  } else if (indexPath.row == 3){
    return 15+100+15;
  } else {
    return 5+14+2+100+15;
  }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 30)];
  view.backgroundColor = [UIColor whiteColor];
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
