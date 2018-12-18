//
//  TECCard.m
//  DeckOfOneCardC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECCard.h"

@implementation TECCard

// MARK: - Iniitalization
- (instancetype)initWithImage:(NSString *)imageUrlString
{
    self = [super init];
    if (self) {
        _imageUrlString = imageUrlString;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        NSArray *cards = dictionary[@"cards"];
        NSDictionary *cardDictionary = cards.firstObject;
        NSString *imageURlAsString = cardDictionary[@"image"];
        _imageUrlString = imageURlAsString;
    }
    return self;
}

@end
