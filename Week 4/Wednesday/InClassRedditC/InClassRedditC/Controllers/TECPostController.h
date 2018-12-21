//
//  TECPostController.h
//  InClassRedditC
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TECPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface TECPostController : NSObject

+ (void)fetchAllPostsForSubRedditWithTitle:(NSString *)title withCompletion:(void (^) (NSArray<TECPost *> * _Nullable posts))completion;

+ (void)fetchImageWithPost:(TECPost *)post completion:(void (^) (UIImage* _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
