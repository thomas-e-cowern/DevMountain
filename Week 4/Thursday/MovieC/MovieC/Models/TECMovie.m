//
//  TECMovie.m
//  MovieC
//
//  Created by Thomas Cowern New on 12/20/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECMovie.h"

@implementation TECMovie

- (instancetype)initWithDictionary:(NSDictionary *)dataDictionary
{
    
    
    self = [super init];
    if (self) {
        
//        NSDictionary *dataDictionary = dictionary[@"results"];
        NSString *title = dataDictionary[@"title"];
        NSNumber *rating = dataDictionary[@"vote_average"];
        NSString *summary = dataDictionary[@"overview"];
        NSString *posterUrlAsString = dataDictionary[@"poster_path"];
        
        _title = title;
        _rating = rating;
        _summary = summary;
        _posterUrlAsString = posterUrlAsString;
        if (_posterUrlAsString == (id)[NSNull null] || _posterUrlAsString.length == 0 ) {
            _posterUrlAsString = @" ";
        }
    }
    return self;
}

@end
