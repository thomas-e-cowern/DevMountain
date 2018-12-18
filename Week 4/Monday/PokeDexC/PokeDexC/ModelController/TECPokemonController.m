//
//  TECPokemonController.m
//  PokeDexC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECPokemonController.h"
#import "TECPokemon.h"

static NSString * const baseUrlString = @"https://pokeapi.co/api/v2/pokemon";

@implementation TECPokemonController

+ (TECPokemonController *) sharedController
{
    static TECPokemonController  *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [TECPokemonController new];
    });
    return sharedController;
}

- (void)fetchPokemonWithSearchTerm:(NSString *)searchTerm completion:(void (*)(TECPokemon * _Nonnull __strong))completion
{
    
    NSURL *baseUrl = [NSURL URLWithString:baseUrlString];
    NSURL *searchUrl = [baseUrl URLByAppendingPathComponent:searchTerm];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchUrl completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        if (error) {
            NSLog(@"Error fetching Pokemon: %@", error);
            completion(nil); return;
        }
        
        if (!data) {
            NSLog(@"Error fetching Pokemon data: %@", error);
            completion(nil); return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error fetching jsonDictionary: %@", error);
            completion(nil); return;
        };
        
        TECPokemon *pokemon = [[TECPokemon alloc] initWithDictionary:jsonDictionary];
        completion(pokemon);
        
    }] resume];
}

@end
