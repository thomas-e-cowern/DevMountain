//
//  Planet.h
//  SolarSystemObjC
//
//  Created by Thomas Cowern New on 12/15/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Planet : NSObject

- (instancetype)initWithName:(NSString *)name
                    diameter:(NSInteger)diameter
                   dayLength:(float)dayLength
           millionKmsFromSun:(float)millionKmsFromSun;

@property(nonatomic, copy, readonly) NSString *name;
@property(nonatomic, copy, readonly) NSString *imageName;
@property(nonatomic, readonly) NSInteger diameter;
@property(nonatomic, readonly) float dayLength;
@property(nonatomic, readonly) float millionKmsFromSun;

@end

NS_ASSUME_NONNULL_END
