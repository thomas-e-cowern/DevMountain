//
//  TECPhoto.h
//  Rover
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECPhoto : NSObject

@property (nonatomic, readonly) NSInteger *imageID;
@property (nonatomic, readonly) NSNumber *solTaken;
@property (nonatomic, readonly) NSString *camera;
@property (nonatomic, readonly) NSString *dateTaken;
@property (nonatomic, readonly) NSString *urlString;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
