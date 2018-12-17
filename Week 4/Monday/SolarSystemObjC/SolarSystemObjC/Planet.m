//
//  Planet.m
//  SolarSystemObjC
//
//  Created by Thomas Cowern New on 12/15/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "Planet.h"

@implementation Planet

- (instancetype)initWithName:(NSString *)name diameter:(NSInteger)diameter dayLength:(float)dayLength millionKmsFromSun:(float)millionKmsFromSun {
    
    self = [super init];
    if (self) {
        _name = [name copy];
        _imageName = [name lowercaseString];
        _diameter = diameter;
        _dayLength = dayLength;
        _millionKmsFromSun = millionKmsFromSun;
    }
    return self;
}

@end
