//
//  SCInfoTableViewController.m
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "SCInfoTableViewController.h"
#import "SCWishListCollectionViewCell.h"
#import "UINavigationController+Ibiza.h"
#import "NSUserDefaults+SC.h"
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory.h>
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory+iOS.h>
#import "UIColor+SC.h"

@interface SCInfoTableViewController () {
    NSArray *wishListItems;
    NIKFontAwesomeIconFactory *factory;
}
@end

@implementation SCInfoTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    factory = [NIKFontAwesomeIconFactory barButtonItemIconFactory];
    [factory setColors:@[[UIColor colorPrimary:1.0f]]];
    wishListItems = [[self person] valueForKeyPath:@"wishList.items"];
    [[self labelUsername] setText:[[self person] valueForKey:@"name"]];
    [[self navigationController] setNavigationBarHidden:NO];
    [[self navigationController] setClear:NO];
    [[self collectionView] setContentInset:UIEdgeInsetsMake(-20, 0, 0, 0)];
    [[self tableView] setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [[self labelDescription] setText:[[[self labelDescription] text] stringByReplacingOccurrencesOfString:@"{username}" withString:[[self person] valueForKey:@"name"]]];
    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    UIBarButtonItem *barButtonBookmark = [[UIBarButtonItem alloc] initWithImage:[factory createImageForIcon:NIKFontAwesomeIconBookmarkO] style:UIBarButtonItemStyleDone target:self action:@selector(bookmarkPerson)];
    
    //    UIBarButtonItem *barButtonBookmark = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(bookmarkPerson)];
    [[self navigationItem] setRightBarButtonItem:barButtonBookmark];
}

- (void)bookmarkPerson {
    [NSUserDefaults addPersonToBookmarks:[self person]];
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

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
