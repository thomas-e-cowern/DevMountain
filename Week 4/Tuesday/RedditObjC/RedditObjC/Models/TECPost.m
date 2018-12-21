//
//  TECPost.m
//  RedditObjC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECPost.h"

@implementation TECPost

- (instancetype)initWithTitle:(NSString *)title ups:(NSInteger)ups commentCount:(NSNumber *)commentCount thumbnail:(NSString *)thumbnail
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _ups = ups;
        _commentCount = [commentCount copy];
        _thumbnail = thumbnail;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *dataDictionary = dictionary[@"data"];
    
    NSString *title = dataDictionary[[TECPost titleKey]];
    
    NSInteger ups = [dataDictionary[[TECPost upsKey]] integerValue];
    
    NSNumber *commentCount = dataDictionary[[TECPost commentCountKey]];
    
    NSString *thumbnail = dataDictionary[[TECPost thumbnailKey]];
    
    return [self initWithTitle:title ups:ups commentCount:commentCount thumbnail:thumbnail];
    
}

// MARK: - keys
+ (NSString *)titleKey
{
    return @"title";
}

+ (NSString *)upsKey
{
    return @"ups";
}

+ (NSString *)commentCountKey
{
    return @"num_comments";
}

+ (NSString *)thumbnailKey
{
    return @"thumbnail";
}

@end
