//
//  StateCollectionViewController.m
//  FlagsC
//
//  Created by Thomas Cowern New on 12/16/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

#import "StateCollectionViewController.h"
#import "StateController.h"
#import "StateCollectionViewCell.h"

@interface StateCollectionViewController ()

@end

@implementation StateCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return StateController.shared.states.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    State *state = StateController.shared.states[indexPath.row];
    cell.state = state;
    return cell;
}

@end
