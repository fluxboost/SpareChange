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
#import "UIFont+SC.h"
#import "SCDonatedViewController.h"
#import "UIViewController+NavigationController.h"

@interface SCInfoTableViewController () {
    NSArray *wishListItems;
    NIKFontAwesomeIconFactory *factory;
    NSDictionary *selectedItem;
}
@end

@implementation SCInfoTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    factory = [NIKFontAwesomeIconFactory barButtonItemIconFactory];
    [factory setColors:@[[UIColor colorPrimary:1.0f]]];
    wishListItems = [[self person] valueForKeyPath:@"wishList.items"];
    [[self labelUsername] setText:[[self person] valueForKey:@"handle"]];
    [[self navigationController] setNavigationBarHidden:NO];
    [[self navigationController] setClear:NO];
    [[self collectionView] setContentInset:UIEdgeInsetsMake(-20, 0, 0, 0)];
    [[self tableView] setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [[self labelDescription] setText:[[[self labelDescription] text] stringByReplacingOccurrencesOfString:@"{username}" withString:[[self person] valueForKey:@"handle"]]];
    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    UIBarButtonItem *barButtonBookmark = [[UIBarButtonItem alloc] initWithImage:[factory createImageForIcon:NIKFontAwesomeIconBookmarkO] style:UIBarButtonItemStyleDone target:self action:@selector(bookmarkPerson)];
    
    //    UIBarButtonItem *barButtonBookmark = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(bookmarkPerson)];
    [[self navigationItem] setRightBarButtonItem:barButtonBookmark];
}

- (void)bookmarkPerson {
    //[NSUserDefaults addPersonToBookmarks:[self person]];
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
    CGFloat price = [[wishListItem valueForKey:@"price"] floatValue];
    [[cell labelPrice] setText:[NSString stringWithFormat:@"£%.2f", price]];
    
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
    //SCWishListCollectionViewCell *cell = (SCWishListCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    //NSMutableDictionary *wishlistItem = [[wishListItems objectAtIndex:[indexPath row]] mutableCopy];
    //[wishlistItem setObject:[NSNumber numberWithBool:YES] forKey:@"isSelected"];
    
    selectedItem = [wishListItems objectAtIndex:[indexPath row]];
    [self showDonateButton];
    NSLog(@"%ld tapped", (long)[indexPath row]);
}

- (void)showDonateButton {
    [[self view] addSubview:[self buttonDonate]];
}

- (UIButton *)buttonDonate {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, [[self view] frame].size.height - 50, [[self view] frame].size.width, 50.0f)];
    [button setBackgroundColor:[UIColor colorPrimary:1.0f]];
    [[button titleLabel] setFont:[UIFont fontSourceSansProBold:20.0f]];
    [button setTitle:[NSString stringWithFormat:@"Donate %@ to %@", [selectedItem valueForKey:@"name"], [[self person] valueForKey:@"handle"]] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDonatePressed) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)buttonDonatePressed {
    
    SCDonatedViewController *viewController = [SCDonatedViewController createWithUsername:[[self person] valueForKey:@"handle"] andProductName:[selectedItem valueForKey:@"name"]];
    [self presentViewController:[viewController withNavigationControllerWithOpaque] animated:YES completion:^{
        
    }];
}

@end
