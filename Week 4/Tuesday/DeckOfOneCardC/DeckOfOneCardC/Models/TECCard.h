//
//  TECCard.h
//  DeckOfOneCardC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECCard : NSObject

// MARK: - Properties
@property (nonatomic, strong) NSString *imageUrlString;

// MARK: - Imitialization
- (instancetype)initWithImage:(NSString *)imageUrlString;

- (instancetype)initWithDictionary:(NSDictionary<NSString*, id>*)dictionary;

@end

NS_ASSUME_NONNULL_END
