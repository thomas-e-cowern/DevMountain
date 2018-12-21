//
//  TECMovie.h
//  MovieSearchObjC
//
//  Created by Thomas Cowern New on 12/21/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECMovie : NSObject

// MARK: - Properties of TECMovie model
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *rating;
@property (nonatomic, copy, readonly) NSString *summary;
@property (nonatomic, copy, readonly, nullable) NSString *posterUrlAsString;

// MARK: - Dicionary
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
