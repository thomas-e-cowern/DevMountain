//
//  TECMarsRoverClient.h
//  Rover
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TECRover.h"
#import "TECPhoto.h"

NS_ASSUME_NONNULL_BEGIN

@interface TECMarsRoverClient : NSObject

+ (void)fetchAllMarsRoversWithCompletion:(void (^) (NSArray * _Nullable roversArray))completion;
//- (instancetype)fetchMissionManifestForRoverNamed:(NSString *)nameOfRover withCompletion:(void (^) (TECRover *rover))completion;
//- (instancetype)fetchPhotosFromRover:(TECRover *)nameOfRover withSol:(NSNumber *)sol withCompetion:(void (^) (NSArray<TECPhoto *> *photos, NSError * error))completion;
//- (instancetype)fetchImageDataForPhoto:(TECPhoto *)photo withCompletion:(void (^) (NSData *))completion;

@end

NS_ASSUME_NONNULL_END
