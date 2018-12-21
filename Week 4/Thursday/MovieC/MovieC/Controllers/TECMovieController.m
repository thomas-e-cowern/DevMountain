//
//  TECMovieController.m
//  MovieC
//
//  Created by Thomas Cowern New on 12/20/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TECMovieController.h"

@implementation TECMovieController

+ (NSURL *)baseUrl
{
    return [NSURL URLWithString:@"https://api.themoviedb.org"];
}

+ (NSURLQueryItem *)apiSecret
{
    return [NSURLQueryItem queryItemWithName:@"api_key" value:@"d67c0e04aa9692e7d1190b230c8cca09"];
}

+ (void)fetchAllMoviesWithTitle:(NSString *)title withCompletion:(void (^)(NSArray<TECMovie *> * _Nullable))completion
{
    NSURL *url = [[[[TECMovieController baseUrl] URLByAppendingPathComponent:@"3"] URLByAppendingPathComponent:@"search"] URLByAppendingPathComponent:@"movie"];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    NSURLQueryItem *queryItem1 = [NSURLQueryItem queryItemWithName:@"query" value:title];
    NSURLQueryItem *queryItem2 = [NSURLQueryItem queryItemWithName:@"api_key" value:@"d67c0e04aa9692e7d1190b230c8cca09"];
    NSURLQueryItem *queryItem3 = [NSURLQueryItem queryItemWithName:@"language" value:@"en"];
    NSURLQueryItem *queryItem4 = [NSURLQueryItem queryItemWithName:@"include_adult" value:@"false"];
    [components setQueryItems:@[queryItem1, queryItem2, queryItem3, queryItem4]];
    
    NSURL *finalMovieUrl = components.URL;
    
    NSLog(@"Movie Url: %@", [finalMovieUrl absoluteString]);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalMovieUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@" 🔥 Error fetching movies from url:> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error withd data from movie:> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (error) {
            NSLog(@"Error with Json Serialization:> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        NSArray *moviesArray = jsonDictionary[@"results"];
        
        
        NSMutableArray *shitArray = [NSMutableArray array];
        for (NSDictionary *movies in moviesArray) {
            TECMovie *movie = [[TECMovie alloc] initWithDictionary:movies];
            if (movie) {
                [shitArray addObject:movie];
            }
        }
        //        NSLog(@"%@", movieArray);
        completion(shitArray);
        
    }]resume];
}

+ (void)fetchPosterWithMovie:(TECMovie *)movie withCompletion:(void (^)(UIImage *))completion
{
    NSURL *posterBaseUrl = [[[NSURL alloc] initWithString:@"http://image.tmdb.org/t/p/w500"] URLByAppendingPathComponent:movie.posterUrlAsString];

    NSLog(@"%@", posterBaseUrl);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:posterBaseUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if(!data) {
            NSLog(@"No data from poster");
            completion(nil);
            return;
        }
        
        UIImage *poster = [[UIImage alloc] initWithData:data];
        completion(poster);
        
    }]resume];
}

@end
