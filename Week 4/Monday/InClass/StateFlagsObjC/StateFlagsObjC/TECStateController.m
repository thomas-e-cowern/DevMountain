//
//  TECStateController.m
//  StateFlagsObjC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECStateController.h"
#import "TECState.h"

@implementation TECStateController

+ (TECStateController *)shared
{
    static TECStateController * shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[TECStateController alloc] init];
    });
    return shared;
}

- (NSArray *)createAllStates
{
    NSMutableArray *placeHolderStates = [[NSMutableArray alloc ] init];
    for (NSString *stateFullName in [TECStateController fullNames]) {
        NSUInteger index = [[TECStateController fullNames] indexOfObject:stateFullName];
        NSString *abbreviation = [TECStateController abbreviations][index];
        TECState *state = [[TECState alloc] initWithName:stateFullName abbreviation:abbreviation];
        [placeHolderStates addObject:state];
    }
    return placeHolderStates;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _states = [self createAllStates];
    }
    return self;
}

+ (NSArray *)abbreviations {
    
    return @[@"AK", @"AL", @"AZ", @"AR", @"CA", @"CO", @"CT", @"DE", @"FL", @"GA", @"HI", @"ID", @"IL", @"IN", @"IA", @"KS", @"KY", @"LA", @"ME", @"MD", @"MA", @"MI", @"MN", @"MS", @"MO", @"MT", @"NE", @"NV", @"NH", @"NJ", @"NM", @"NY", @"NC", @"ND", @"OH", @"OK", @"OR", @"PA", @"RI", @"SC", @"SD", @"TN", @"TX", @"UT", @"VT", @"VA", @"WA", @"WV", @"WI", @"WY"];
}

+ (NSArray *)fullNames {
    
    return @[@"Alaska", @"Alabama", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming"];
}

@end
