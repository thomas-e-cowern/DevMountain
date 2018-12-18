//
//  TECEntryController.m
//  JournalC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECEntryController.h"
#import "TECEntry.h"

@implementation TECEntryController

+ (TECEntryController *)shared {
    static TECEntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[TECEntryController alloc] init];
        shared.entries = [NSMutableArray new];
        [shared loadFromPersistentStorage];
    });
    return shared;
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (TECEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        TECEntry *entry = [[TECEntry new] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}

- (void)addEntry:(TECEntry *)entry
{
    [self.entries addObject:entry];
    [self saveToPersistentStorage];
}

- (void)removeEntry:(TECEntry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];
//    [self.entries removeObject:entry.timeStamp];
}

- (void)modifyEntry:(TECEntry *)entry withTitle:(NSString *)title text:(NSString *)text
{
    entry.title = title;
    entry.text = text;
    [self saveToPersistentStorage];
}

@end
