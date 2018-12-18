//
//  TECCardController.m
//  DeckOfOneCardC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "TECCardController.h"
#import "TECCard.h"
#import <UIKit/UIKit.h>

@implementation TECCardController

// MARK: - Methods
+ (void)drawCardWithCompletion:(void (^)(TECCard * _Nonnull))completion
{
    //URL
    NSURL *url = [[NSURL alloc] initWithString:@"https://deckofcardsapi.com/api/deck/new/draw?count=1"];
    NSLog(@"%@", url.absoluteString);
    
    // Default Request header and body being used.
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Serialization code
        if (error) {
            NSLog(@" 😡 There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (data == nil) {
            NSLog(@" 😡  Couldn't get data back in fetchCard");
            completion(nil);
            return;
        }
        
        // Serialize
        NSDictionary *cardDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (cardDictionary == nil) {
            NSLog(@" 😡 Couldn't get a dictionary");
        }
        TECCard *card = [[TECCard alloc] initWithDictionary:cardDictionary];
        completion(card);
    }]resume];
}

+ (void)fetchCardImageWithCard:(TECCard *)card completion:(void (^)(UIImage * _Nonnull))completion
{
    // Card image url
    NSURL *cardUrl = [[NSURL alloc] initWithString:card.imageUrlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:cardUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@" 😡 There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (data == nil) {
            NSLog(@" 😡  Couldn't get data back in fetchImage");
            completion(nil);
            return;
        }
        
        TECCard *cardImage = [UIImage imageWithData:data];
        
        completion(cardImage);
    }]resume];
    
}

@end
