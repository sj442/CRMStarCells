//
//  EPViewController.m
//  CRMStarCells
//
//  Created by Sunayna Jain on 1/29/15.
//  Copyright (c) 2015 Enhatch. All rights reserved.
//

#import "EPViewController.h"
#import "EPTableView.h"
#import "EPSwipeCell.h"

@interface EPViewController ()

@end

@implementation EPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  EPTableView *tv = [[EPTableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
  [self.view addSubview:tv];
  tv.dataSource = self;
  tv.delegate = self;
  
  [tv registerClass:[EPSwipeCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  EPSwipeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if (!cell) {
    cell = [[EPSwipeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
  }
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return [EPSwipeCell cellHeight];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
