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

- (instancetype)fetchAllMarsRoverWithCompletion:(void (^) (NSArray<TECRover *> *rovers, NSError * _Nullable error))completion;
- (instancetype)fetchMissionManifestForRoverNamed:(NSString *)nameOfRover withCompletion:(void (^) (TECRover *rover))completion;
- (instancetype)fetchPhotosFromRover:(TECRover *)nameOfRover withSol:(NSNumber *)sol withCompetion:(void (^) (NSArray<TECPhoto *> *photos, NSError * error))completion;
- (instancetype)fetchImageDataForPhoto:(TECPhoto *)photo withCompletion:(void (^) (NSData *))completion;
+ (NSURL *)URLForInfoForRover:(NSString *)roverName;

@end

NS_ASSUME_NONNULL_END
