//
//  TECPokemon.h
//  PokeDexC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, readonly) NSArray <NSString *> *abilities;

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSArray *> *)abilities  NS_DESIGNATED_INITIALIZER;

@end

@interface TECPokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary <NSString *, id>*)dictionary;
@end

NS_ASSUME_NONNULL_END
