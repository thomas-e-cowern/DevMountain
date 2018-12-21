//
//  TECMovieController.h
//  MovieC
//
//  Created by Thomas Cowern New on 12/20/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TECMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface TECMovieController : NSObject

+ (void)fetchAllMoviesWithTitle:(NSString *)title withCompletion:(void (^)(NSArray<TECMovie *> *))completion;

+ (void)fetchPosterWithMovie:(TECMovie *)movie withCompletion:(void (^)(UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
