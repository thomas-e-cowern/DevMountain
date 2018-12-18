//
//  TECCardController.h
//  DeckOfOneCardC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TECCard.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECCardController : NSObject

+ (void)drawCardWithCompletion:(void (^) (TECCard *))completion;

+ (void)fetchCardImageWithCard: (TECCard *)card completion: (void (^) (UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
