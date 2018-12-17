//
//  StateCollectionViewCell.h
//  FlagsC
//
//  Created by Thomas Cowern New on 12/16/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "State.h"

NS_ASSUME_NONNULL_BEGIN

@interface StateCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *flagImageview;
@property (weak, nonatomic) IBOutlet UILabel *flagLabel;

@property (nonatomic, strong, nonnull) State *state;

@end

NS_ASSUME_NONNULL_END
