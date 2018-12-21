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
    return [NSURL URLWithString:@"https://api.nasa.gov/mars-photos/api/v1/rovers"];
}

+ (void)fetchAllMarsRoversWithCompletion:(void (^)(NSArray * _Nullable roversArray))completion
{
    NSURL *roverUrl = [TECMarsRoverClient baseUrl];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:roverUrl resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"api_key" value:@"X18Oa1uoLN8Bh4ivZIjgIQxW9DR8NZufD9WUiNU6"]];
    NSURL *finalRoverUrl = urlComponents.URL;
    
    NSLog(@"Here: %@", [finalRoverUrl absoluteString]);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalRoverUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching rover url:> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error with data from rover:> %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *roverDictionary = jsonDictionary[@"rovers"];
        NSLog(@" 😡 roverDictionary: ");
        NSLog(@"%@", roverDictionary);
        
        NSMutableArray *roversArray = [NSMutableArray new];
        for (NSDictionary *rovers in roverDictionary) {
            TECRover *rover = [[TECRover alloc] initWithDictionary:rovers];
            [roversArray addObject:rover];
        }
        NSLog(@"%@", roversArray[0]);
        completion(roversArray);
        
    }]resume];
}

//- (instancetype)fetchMissionManifestForRoverNamed:(NSString *)nameOfRover withCompletion:(void (^)(TECRover * _Nonnull))completion
//{
//
//    return completion("", error);
//}
//
//- (instancetype)fetchPhotosFromRover:(TECRover *)nameOfRover withSol:(NSNumber *)sol withCompetion:(void (^)(NSArray<TECPhoto *> * _Nonnull, NSError * _Nonnull))completion
//{
//
//    return completion("", error);
//
//}
//
//- (instancetype)fetchImageDataForPhoto:(TECPhoto *)photo withCompletion:(void (^)(NSData * _Nonnull))completion
//{
//
//    return completion("", error);
//}
@end
