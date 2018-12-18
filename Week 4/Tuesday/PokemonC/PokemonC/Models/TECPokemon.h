//
//  TECPokemon.h
//  PokemonC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Jayden Garrick. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECPokemon : NSObject

// MARK: - Properties
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly, nullable) NSArray<NSString *> *abilities;

// MARK: - Initialization
- (instancetype)initWithName:(NSString *)name
                  identifier:(NSUInteger)identifier
                   abilities:(NSArray<NSString *>*)abilities;

- (instancetype)initWithDictionary:(NSDictionary<NSString*, id>*)dictionary;

@end
NS_ASSUME_NONNULL_END
