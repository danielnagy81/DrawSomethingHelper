//
//  ResultTableView.m
//  DrawSomethingHelper
//
//  Created by Dani on 15/09/14.
//  Copyright (c) 2014 Dani. All rights reserved.
//

#import "ResultTableView.h"

NSString *const CellIdentifier = @"ResultsCell";

@implementation ResultTableView

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"Results";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = self.results[indexPath.row];
    return cell;
}

@end
