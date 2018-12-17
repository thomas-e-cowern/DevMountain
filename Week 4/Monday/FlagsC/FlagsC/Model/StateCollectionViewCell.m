//
//  StateCollectionViewCell.m
//  FlagsC
//
//  Created by Thomas Cowern New on 12/16/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "StateCollectionViewCell.h"
#import "State.h"

@implementation StateCollectionViewCell

- (void) setState:(State *)state
{
    _state = state;
    [self updateWithState: state];
}

- (void) updateWithState:(State *)state
{
    if (state) {
        self.flagImageview.image = [UIImage imageNamed: state.abbreviation];
        self.flagLabel.text = state.name;
    }
}

@end
