//
//  TECMovieController.m
//  MovieSearchObjC
//
//  Created by Thomas Cowern New on 12/21/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECMovieController.h"

@implementation TECMovieController

+ (void)fetchAllMoviesWithTitle:(NSString *)title withCompletion:(void (^)(NSArray<TECMovie *> * _Nullable))completion
{
    // MARK: - Properties
    NSURL *baseUrl = [NSURL URLWithString:@"https://api.themoviedb.org"];
    NSURLQueryItem *apiSecret = [NSURLQueryItem queryItemWithName:@"api_key" value:@"d67c0e04aa9692e7d1190b230c8cca09"];
    
    // MARK: - Completing the Url
    /*
    Example full Url:
    https://api.themoviedb.org/3/search/movie?query=Star%20Wars&api_key=d67c0e04aa9692e7d1190b230c8cca09&language=en&include_adult=false
     */
    
    // adding api requirements to baseUrl
    NSURL *url = [[[baseUrl URLByAppendingPathComponent:@"3"] URLByAppendingPathComponent:@"search"] URLByAppendingPathComponent:@"movie"];
    
    // adding query items to url
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    NSURLQueryItem *query = [NSURLQueryItem queryItemWithName:@"query" value:title];
    NSURLQueryItem *language = [NSURLQueryItem queryItemWithName:@"language" value:@"en"];
    NSURLQueryItem *includeAdult = [NSURLQueryItem queryItemWithName:@"include_adult" value:@"false"];
    
    // combining query items into array
    [components setQueryItems:@[query, apiSecret, language, includeAdult]];
    
    // getting the final url with components and query items
    NSURL *completedMovieUrl = components.URL;
    
    NSLog(@"Movie url: %@", [completedMovieUrl absoluteString]);
    
    // request would go here if we needed one.. but we're using defaults
    
    // MARK: - URLSession and dataTask
    // making the fetch call to the API
    [[[NSURLSession sharedSession] dataTaskWithURL:completedMovieUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // checking for errors if the call fails
        if (error) {
            NSLog(@"Error from URLSession: :> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        // checking to see if there is data
        if (!data) {
            NSLog(@"Error in URLSession data: :> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        // Serialization of data into usable info
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (error) {
            NSLog(@"Error with JSONSerialization: :> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        // creating an array to return the movie data
        NSMutableArray *movieArray = [NSMutableArray new];
        
        // pulling out the array of movies from the json
        NSArray *fetchedMoviesArray = jsonDictionary[@"results"];
    
        // going through the movies and adding the movie info to the array to be returned
        for (NSDictionary *movies in fetchedMoviesArray) {
            TECMovie *movie = [[TECMovie alloc] initWithDictionary:movies];
            [movieArray addObject:movie];
        }
        
        // returning the array of movies
        completion(movieArray);
    }]resume];
}

+ (void)fetchPosterWithMovie:(TECMovie *)movie withCompletion:(void (^)(UIImage * _Nullable))completion
{
    // MARK: - Properties
    NSURL *posterBaseUrl = [NSURL URLWithString:@"http://image.tmdb.org/t/p/w500"];
    
    // setting up the url to get the movie poster
    NSURL *finalPosterUrl = [posterBaseUrl URLByAppendingPathComponent:movie.posterUrlAsString];
    
    // making the poster fetch call to the API
    [[[NSURLSession sharedSession] dataTaskWithURL:finalPosterUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // checking if immediate failure of poster call
        if (error) {
            NSLog(@"Error with poster session :> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        // checking to see if there is data
        if (!data) {
            NSLog(@"No data from poster :> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        // retrieving poster image
        UIImage *poster = [[UIImage alloc] initWithData:data];
        completion(poster);
    }]resume];
}


@end
