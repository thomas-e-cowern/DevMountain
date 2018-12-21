//
//  ViewController.m
//  StretchProblem
//
//  Created by Thomas Cowern New on 12/20/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [ViewController printFizzBuzzWithInteger:50];
    
//    [ViewController findTheClosestFibbonacci:10];
}

+ (void)printFizzBuzzWithInteger:(NSInteger)limitNumber
{
    for (int i = 1; i < limitNumber + 1; i++) {
        if (i % 3 == 0 && i % 5 == 0) {
            NSLog(@"DevMtn");
        } else if (i % 3 == 0) {
            NSLog(@"Dev");
        } else if (i % 5 == 0) {
            NSLog(@"Mtn");
        } else {
            NSLog(@"%d", i);
        }
    }
}

//+ (void)findTheClosestFibbonacci:(NSInteger)number
//{
//    NSArray *fibArray = [[NSArray alloc] init];
//
//    for (int i = 2; i < number + 1; i++) {
//        int f = (i - 1) + (i - 2);
//        NSLog(@"%d", f);
//    }
//}

@end
