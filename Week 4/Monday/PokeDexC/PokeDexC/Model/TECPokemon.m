//
//  TECPokemon.m
//  PokeDexC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECPokemon.h"

@implementation TECPokemon

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSArray *> *)abilities
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _identifier = identifier;
        _abilities = [abilities copy];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"" identifier:0 abilities:@[]];
}

@end


@implementation TECPokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray * abilitiesDictionaryArray = dictionary[@"abilities"];
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    for (NSDictionary *abilityDictionary in abilitiesDictionaryArray) {
        NSDictionary *nestedDictionary = abilityDictionary[@"ability"];
        NSString *abilityName = nestedDictionary[@"name"];
        [abilities addObject:abilityName];
        
    }
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
