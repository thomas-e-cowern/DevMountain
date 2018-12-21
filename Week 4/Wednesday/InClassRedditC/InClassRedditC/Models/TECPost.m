//
//  TECPost.m
//  InClassRedditC
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECPost.h"

@implementation TECPost

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    // Pull all values out of the dictionary or return nil
    NSDictionary *dataDictionary = dictionary[@"data"];
    NSString *title = dataDictionary[@"title"];
    NSNumber *upVotes = dataDictionary[@"ups"];
    NSNumber *commentCount = dataDictionary[@"num_comments"];
    NSString *thumbnailUrlAsString = dataDictionary[@"thumbnail"];
    
    if (![title isKindOfClass:[NSString class]] || ![upVotes isKindOfClass:[NSNumber class]]  || ![commentCount isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    // Initialize the object properties using the dictionary values
    self = [super init];
    if (self) {
        _title = title;
        _upVotes = upVotes;
        _commentCount = commentCount;
        _thumbnailUrlAsString = thumbnailUrlAsString;
    } 
    return self;
}

@end
