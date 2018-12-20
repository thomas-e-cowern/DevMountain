//
//  TECSol.m
//  Rover
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECSol.h"

@implementation TECSol

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    // Pull values out of the dictionary
    NSDictionary *solDictionary = dictionary[@"photo_manifest"];
    NSNumber *sol = solDictionary[@"sol"];
    NSNumber *totalPhotos = solDictionary[@"total_photos"];
    NSArray *cameras = solDictionary[@"cameras"];
    
    self = [super init];
    if (self) {
        _sol = sol;
        _totalPhotos = totalPhotos;
        _cameras = cameras;
    }
    return self;
}
@end
