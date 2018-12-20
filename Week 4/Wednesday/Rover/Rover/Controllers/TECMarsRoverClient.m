//
//  TECMarsRoverClient.m
//  Rover
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECMarsRoverClient.h"

@implementation TECMarsRoverClient

+ (NSString *)apiKey {
    static NSString *apiKey = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *apiKeysURL = [[NSBundle mainBundle] URLForResource:@"APIKeys" withExtension:@"plist"];
        if (!apiKeysURL) {
            NSLog(@"Error! APIKeys file not found!");
            return;
        }
        NSDictionary *apiKeys = [[NSDictionary alloc] initWithContentsOfURL:apiKeysURL];
        apiKey = apiKeys[@"APIKey"];
    });
    return apiKey;
}

+ (NSURL *)baseUrl
{
    return [NSURL URLWithString:@" https://api.nasa.gov/mars-photos/api/v1"];
}

+ (NSURL *)URLForInfoForRover:(NSString *)roverName
{
    
    NSURL *url = [[[TECMarsRoverClient baseUrl] URLByAppendingPathComponent:@"manifests"] URLByAppendingPathComponent:roverName];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"api_key" value:@"X18Oa1uoLN8Bh4ivZIjgIQxW9DR8NZufD9WUiNU6"]];
    
    return  url;
}

+ (NSURL *)URLForPhotosFromRover:(NSString *)roverName onSol:(NSNumber*)sol
{
    NSURL *url = [[[[TECMarsRoverClient baseUrl] URLByAppendingPathComponent:@"rovers"] URLByAppendingPathComponent:roverName] URLByAppendingPathComponent:@"photos"];
    return url;
}
@end
