//
//  TECState.h
//  StateFlagsObjC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECState : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic) NSString *abbreviation;

- (instancetype)initWithName:(NSString *)name
              abbreviation:(NSString *)abbreviation;

@end

NS_ASSUME_NONNULL_END
