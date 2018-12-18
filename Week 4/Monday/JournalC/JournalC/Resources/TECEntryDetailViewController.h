//
//  TECEntryDetailViewController.h
//  JournalC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TECEntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TECEntryDetailViewController : UIViewController

@property (nonatomic, strong, nonnull) TECEntry *entry;

@end

NS_ASSUME_NONNULL_END
