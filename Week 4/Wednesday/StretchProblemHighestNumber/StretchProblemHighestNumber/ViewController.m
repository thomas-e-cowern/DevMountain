//
//  ViewController.m
//  StretchProblemHighestNumber
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSArray *array = @[@1, @400, @9, @3, @17, @23, @1, @8, @123, @9];
    
    NSNumber *highest = 0;
    
    for (int i = 0; i < array.count - 1; i++) {
        NSNumber *x = array[i];
        NSLog(@"%@", x);
        NSNumber *y = array[i + 1];
        NSLog(@"%@", y);
        if (x > y) {
            highest = x;
            NSLog(@"%@", highest);
        } else {
            highest = y;
        }

    }
    
    NSLog(@"%@", highest);
    
}


@end
