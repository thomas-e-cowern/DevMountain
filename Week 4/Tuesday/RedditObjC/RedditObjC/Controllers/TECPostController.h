//
//  TECPostController.h
//  RedditObjC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TECPost;

@interface TECPostController : NSObject
NS_ASSUME_NONNULL_BEGIN

+ (instancetype)sharedController;

- (void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void (^) (NSArray<TECPost *> *posts, NSError  * _Nullable error))completion;

- (void)fetchThumbnailImage: (TECPost *)post Completion:(void (^) (UIImage *))completion;

NS_ASSUME_NONNULL_END
@end


