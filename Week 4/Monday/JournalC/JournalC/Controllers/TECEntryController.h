//
//  TECEntryController.h
//  JournalC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TECEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface TECEntryController : NSObject

// MARK: - Shared instance
+ (TECEntryController *)shared;

// MARK: - Properties
@property (nonatomic, strong) NSMutableArray *entries;

// MARK: - Methods
- (void)addEntry:(TECEntry *)entry;
- (void)removeEntry:(TECEntry *)entry;
- (void)modifyEntry:(TECEntry *)entry withTitle:(NSString *)title text:(NSString *)text;
- (void)saveToPersistentStorage;
- (void)loadFromPersistentStorage;

@end

NS_ASSUME_NONNULL_END
