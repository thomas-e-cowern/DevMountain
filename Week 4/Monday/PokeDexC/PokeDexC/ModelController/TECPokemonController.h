//
//  TECPokemonController.h
//  PokeDexC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TECPokemon;

NS_ASSUME_NONNULL_BEGIN

@interface TECPokemonController : NSObject

- (void)fetchPokemonWithSearchTerm:(NSString *)searchTerm completion:(void (*) (TECPokemon *))completion;

+ (TECPokemonController *) sharedController;

@end

NS_ASSUME_NONNULL_END
