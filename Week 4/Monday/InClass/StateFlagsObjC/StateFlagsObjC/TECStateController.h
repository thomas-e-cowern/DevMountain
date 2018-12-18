//
//  TECStateController.h
//  StateFlagsObjC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECStateController : NSObject

@property (nonatomic, readonly) NSArray *states;

+ (TECStateController *)shared;

@end

NS_ASSUME_NONNULL_END
