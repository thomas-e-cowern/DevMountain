//
//  TECPostController.h
//  RedditObjC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TECPost;

@interface TECPostController : NSObject
NS_ASSUME_NONNULL_BEGIN

+ (instancetype)sharedController;

- (void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void (^) (NSArray<TECPost *> *posts, NSError  * _Nullable error))completion;

NS_ASSUME_NONNULL_END
@end


