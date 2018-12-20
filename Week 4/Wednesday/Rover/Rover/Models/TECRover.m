//
//  TECRover.m
//  Rover
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECRover.h"
#import "TECSol.h"

@implementation TECRover

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    // pull values out of the dictionary or return nil
    NSDictionary *roversDictionary = dictionary[@"rovers"];
    NSString *nameOfRover = roversDictionary[@"name"];
    NSString *launchDate = roversDictionary[@"launch_date"];
    NSString *landingDate = roversDictionary[@"landing_date"];
    NSNumber *maxSol = roversDictionary[@"max_sol"];
    NSString *maxDate = roversDictionary[@"max_date"];
    NSEnumerator *status = roversDictionary[@"status"];
    NSNumber *totalPhotos = roversDictionary[@"total_photos"];

    
    
    
    self = [super init];
    if (self) {
        _nameOfRover = nameOfRover;
        _launchDate = launchDate;
        _landingDate = landingDate;
        _maxSol = maxSol;
        _maxDate = maxDate;
        _status = status;
        _totalPhotos = totalPhotos;
    }
    return self;
}

@end
