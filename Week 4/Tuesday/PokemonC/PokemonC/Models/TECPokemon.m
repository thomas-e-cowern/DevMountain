//
//  TECPokemon.m
//  PokemonC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Jayden Garrick. All rights reserved.
//

#import "TECPokemon.h"

@implementation TECPokemon

// MARK: - Initialization
- (instancetype)initWithName:(NSString *)name
                  identifier:(NSUInteger)identifier
                   abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self) {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    
    
    NSArray *abilitiesDictionaries = dictionary[@"abilities"];
    
    // Create an empty array to put these ability names into
    NSMutableArray<NSString *> *abilities = [NSMutableArray new];
    
    // Loop through each dictionary and get the nane and put into the array
    for (NSDictionary *dictionary in abilitiesDictionaries) {
        NSString *abilityName = dictionary[@"ability"][@"name"];
        [abilities addObject:abilityName];
    }
    
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
