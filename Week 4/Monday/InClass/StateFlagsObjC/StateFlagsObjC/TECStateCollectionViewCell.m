//
//  TECStateCollectionViewCell.m
//  StateFlagsObjC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECStateCollectionViewCell.h"
#import "TECState.h"

@interface TECStateCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end

@implementation TECStateCollectionViewCell

- (void)updateViews:(TECState *)state
{
    self.flagImageView.image = [UIImage imageNamed:self.state.abbreviation];
    self.stateLabel.text = self.state.name;
}

- (void)setState:(TECState *)state
{
    _state = state;
    [self updateViews: state];
}

@end
