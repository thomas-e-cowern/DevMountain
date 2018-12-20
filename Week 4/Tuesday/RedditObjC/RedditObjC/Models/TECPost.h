//
//  TECPost.h
//  RedditObjC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TECPost : NSObject
NS_ASSUME_NONNULL_BEGIN

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger ups;
@property (nonatomic, readonly) NSNumber *commentCount;

- (instancetype)initWithTitle:(NSString *)title ups:(NSInteger)ups commentCount:(NSNumber *)commentCount;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
NS_ASSUME_NONNULL_END
@end


