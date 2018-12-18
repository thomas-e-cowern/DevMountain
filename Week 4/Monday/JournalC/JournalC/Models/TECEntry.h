//
//  TECEntry.h
//  JournalC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TECEntry : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSDate *timeStamp;

- (instancetype) initWithTitle:(NSString *)title
                         text:(NSString *)text
                    timeStamp:(NSDate *)timeStamp;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *) dictionaryRepresentation;

@end

NS_ASSUME_NONNULL_END
