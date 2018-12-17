//
//  StateController.h
//  FlagsC
//
//  Created by Thomas Cowern New on 12/16/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StateController : NSObject

@property (nonatomic, strong) NSArray *states;

// Shared instance
+ (StateController *)shared;

- (NSArray *)addStates;


@end

NS_ASSUME_NONNULL_END
