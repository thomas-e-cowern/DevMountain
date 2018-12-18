//
//  TECEntryDetailViewController.m
//  JournalC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECEntryDetailViewController.h"
#import "TECEntryController.h"

@interface TECEntryDetailViewController ()

// MARK: - Properties
//@property (strong, nonatomic) TECEntry *entry;

 // MARK: - Outlets
@property (weak, nonatomic) IBOutlet UITextView *entryTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@end

@implementation TECEntryDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateEntryWith];
}


- (void) updateEntryWith
{
    if (self.entry) {
        self.entryTextField.text = self.entry.text;
        self.titleTextField.text = self.entry.title;
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        [[TECEntryController shared] modifyEntry:self.entry withTitle:self.titleTextField.text text:self.entryTextField.text];
    } else {
        TECEntry *entry = [[TECEntry alloc] initWithTitle:self.titleTextField.text text:_entryTextField.text timeStamp:[NSDate date]];
        [[TECEntryController shared] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clearButtonTapped:(id)sender {
    self.titleTextField.text = @"";
    self.entryTextField.text = @"";
}

@end
