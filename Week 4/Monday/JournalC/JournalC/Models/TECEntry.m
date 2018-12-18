//
//  TECEntry.m
//  JournalC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECEntry.h"

@implementation TECEntry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timeStamp:(NSDate *)timeStamp
{
    {
        self = [super init];
        if (self) {
            _title = title;
            _text = text;
            _timeStamp = timeStamp;
        }
        return self;
    }
}

- (instancetype) initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *text = dictionary[@"text"];
    NSDate *timeStamp = dictionary[@"timestamp"];
    
    return [self initWithTitle:title text:text timeStamp:timeStamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @ {
        @"title": self.title,
        @"text": self.text,
        @"timeStamp": self.timeStamp
    };
}

@end
