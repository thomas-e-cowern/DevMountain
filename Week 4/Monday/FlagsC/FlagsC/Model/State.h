//
//  State.h
//  FlagsC
//
//  Created by Thomas Cowern New on 12/16/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface State : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *abbreviation;

- (instancetype)initWithName:(NSString *)name
                abbreviation:(NSString *)abbreviation;


@end

NS_ASSUME_NONNULL_END
