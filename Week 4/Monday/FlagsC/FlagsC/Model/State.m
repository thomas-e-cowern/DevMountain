//
//  State.m
//  FlagsC
//
//  Created by Thomas Cowern New on 12/16/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "State.h"

@implementation State

- (instancetype)initWithName:(NSString *)name abbreviation:(NSString *)abbreviation
{
    self = [super init];
    if (self) {
        _name = name;
        _abbreviation = abbreviation;
    }
    return self;
}

@end
