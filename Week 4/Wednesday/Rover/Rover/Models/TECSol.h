//
//  TECSol.h
//  Rover
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECSol : NSObject

@property (nonatomic, readonly) NSNumber *sol;
@property (nonatomic, readonly) NSNumber *totalPhotos;
@property (nonatomic, readonly) NSArray *cameras;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
