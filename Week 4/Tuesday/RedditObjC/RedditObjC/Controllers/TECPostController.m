//
//  TECPostController.m
//  RedditObjC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECPostController.h"
#import "TECPost.h"

@implementation TECPostController

+ (instancetype)sharedController
{
    static TECPostController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TECPostController alloc] init];
    });
    return sharedInstance;
}

// MARK: - Properties
- (NSURL *)baseUrl
{
    return [NSURL URLWithString:@"http://www.reddit.com/r/"];
}

// MARK: - Fetch
- (void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<TECPost *> * _Nonnull, NSError * _Nonnull))completion
{
    // building up the url with search term
    NSURL *searchUrl = [self baseUrl];
    searchUrl = [searchUrl URLByAppendingPathComponent:searchTerm];
    searchUrl = [searchUrl URLByAppendingPathExtension:@"json"];
    NSLog(@"%@", searchUrl.absoluteString);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@" 😡 No data from task");
            completion(nil, error);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"JSONDictionary is not a dictionary class");
            completion(nil, error);
            return;
        }
        
        NSDictionary *postDataDictionaries = jsonDictionary[@"data"];
        NSArray *childArray = postDataDictionaries[@"children"];
        
        NSMutableArray *postsArray = [NSMutableArray array];
        
        for (NSDictionary *dataDictionary in childArray) {
            TECPost *post = [[TECPost alloc] initWithDictionary:dataDictionary];
            [postsArray addObject:post];
        }
        
        NSLog(@"%@", postsArray);
        completion(postsArray, nil);
        
        
    }]resume];
}
@end
