//
//  TECStateCollectionViewCell.h
//  StateFlagsObjC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TECState.h"

NS_ASSUME_NONNULL_BEGIN

@interface TECStateCollectionViewCell : UICollectionViewCell

@property (nonatomic) TECState *state;

- (void) updateViews;

@end

NS_ASSUME_NONNULL_END
