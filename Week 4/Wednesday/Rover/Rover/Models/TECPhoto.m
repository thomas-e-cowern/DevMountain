//
//  TECPhoto.m
//  Rover
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECPhoto.h"

@implementation TECPhoto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    // Pull all values out of the dictionary
    NSDictionary *photoDictionary = dictionary[@"photos"];
    NSNumber *solTaken = photoDictionary[@"sol"];
    NSString *camera = photoDictionary[@"camera"];
    NSString *dateTaken = photoDictionary[@"earth_date"];
    NSString *urlString = photoDictionary[@"img-src"];
    
    
    self = [super init];
    if (self) {
        _solTaken = solTaken;
        _camera = camera;
        _dateTaken = dateTaken;
        _urlString = urlString;
    }
    return self;
}

@end
