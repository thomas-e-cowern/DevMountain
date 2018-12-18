//
//  TECPokemonController.h
//  PokemonC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Jayden Garrick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TECPokemon.h"

//NS_ASSUME_NONNULL_BEGIN

@interface TECPokemonController : NSObject

// MARK: - Methods
+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm
                       completion: (void (^) (TECPokemon*))completion;


@end

//NS_ASSUME_NONNULL_END
