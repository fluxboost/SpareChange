//
//  SCInfoViewController.m
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "SCInfoViewController.h"
#import "SCWishListCollectionViewCell.h"

@interface SCInfoViewController () {
    NSArray *wishListItems;
    
}
@end

@implementation SCInfoViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    wishListItems = [[self person] valueForKeyPath:@"wishList.items"];
    [[self collectionView] setContentInset:UIEdgeInsetsMake(-20, 0, 0, 0)];
    //[self setAutomaticallyAdjustsScrollViewInsets:NO];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [wishListItems count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SCWishListCollectionViewCell *cell = (SCWishListCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"wishlistCell" forIndexPath:indexPath];
    
    NSDictionary *wishListItem = [wishListItems objectAtIndex:[indexPath row]];
    
    [[cell labelTitle] setText:[wishListItem valueForKey:@"name"]];
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [wishListItem valueForKey:@"name"]]];
    
    if (!image) {
        image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [wishListItem valueForKey:@"name"]]];
    }
    
    if (image) {
        [[cell imageViewWishListImage] setImage:image];
    }

    return cell;
}

#pragma mark - Collection View Flow Layout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = collectionView.frame.size.width/1.5;
    CGFloat height = width;
    
    return CGSizeMake(width, height);
}

@end
