//
//  TECEntryTableViewController.m
//  JournalC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECEntryTableViewController.h"
#import "TECEntryController.h"
#import "TECEntryDetailViewController.h"
#import "TECEntry.h"

@interface TECEntryTableViewController ()

@end

@implementation TECEntryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[TECEntryController shared] entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"journalCell" forIndexPath:indexPath];
    TECEntry *entry = [[TECEntryController shared] entries][indexPath.row];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = [dateFormatter stringFromDate:entry.timeStamp];
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        TECEntry *entry = [[TECEntryController shared] entries][indexPath.row];
        [[TECEntryController shared] removeEntry:entry];
    
    }
    
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"editEntry"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TECEntryDetailViewController *destViewController = segue.destinationViewController;
        destViewController.entry = [[[TECEntryController shared] entries] objectAtIndex:indexPath.row];
    }
}

@end
