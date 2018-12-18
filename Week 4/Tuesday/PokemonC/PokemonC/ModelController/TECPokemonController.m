//
//  TECPokemonController.m
//  PokemonC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Jayden Garrick. All rights reserved.
//

#import "TECPokemonController.h"
#import "TECPokemon.h"

@implementation TECPokemonController

// MARK: - Methods
+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(TECPokemon *))completion
{
    // URL
    NSURL *baseUrl = [NSURL URLWithString:@"https://pokeapi.co/api/v2/pokemon"];
    NSURL *searchUrl = [baseUrl URLByAppendingPathComponent:[searchTerm lowercaseString]];
    NSLog(@"%@", searchUrl.absoluteString);
    
    // Request (if needed)
    
    // Datatask + resume
    [[[NSURLSession sharedSession] dataTaskWithURL:searchUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Serialization Code
        if (error)
        {
            NSLog(@" 😡 There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (data == nil) {
            NSLog(@" 😡  Couldn't get data back in fetchPokemon");
            completion(nil);
            return;
        }
        
        // Serialize
        NSDictionary *pokemonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        TECPokemon *pokemon = [[TECPokemon alloc] initWithDictionary:pokemonDictionary];
        completion(pokemon);
        
    }]resume];
}

@end
