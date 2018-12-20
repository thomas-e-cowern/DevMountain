//
//  TECRover.h
//  Rover
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECRover : NSObject

@property (nonatomic, readonly) NSString *nameOfRover;
@property (nonatomic, readonly) NSString *launchDate;
@property (nonatomic, readonly) NSString *landingDate;
@property (nonatomic, readonly) NSNumber *maxSol;
@property (nonatomic, readonly) NSString *maxDate;
@property (nonatomic, readonly) NSEnumerator *status;
@property (nonatomic, readonly) NSNumber *totalPhotos;
@property (nonatomic, readonly) NSArray *solDescriptions;

typedef NS_ENUM(NSInteger, status) {
    active,
    inactive
};

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
