//
//  TECPostController.m
//  InClassRedditC
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECPostController.h"

@implementation TECPostController

+ (NSURL *)baseUrl
{
    return [NSURL URLWithString:@"https://www.reddit.com/r"];
}

 + (void)fetchAllPostsForSubRedditWithTitle:(NSString *)title withCompletion:(void (^)(NSArray<TECPost *> * _Nullable))completion
{
    // Construct the url
    NSURL *url = [[[TECPostController baseUrl] URLByAppendingPathComponent:title] URLByAppendingPathExtension:@"json"];
    
    NSLog(@"%@", [url absoluteString]);
    
    // Call the dataTask, serialize json and resume and completion
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error in %s, %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Data error");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        NSArray *childrenArray = dataDictionary[@"children"];
        
        NSMutableArray *postsArray = [NSMutableArray new];
        for (NSDictionary *postDictionary in childrenArray) {
            TECPost *post = [[TECPost alloc] initWithDictionary:postDictionary];
            [postsArray addObject:post];
        }
        NSLog(@"%@", postsArray);
        completion(postsArray);
        
    }]resume];
}

@end
