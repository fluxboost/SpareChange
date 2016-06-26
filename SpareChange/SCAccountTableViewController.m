//
//  SCAccountTableViewController.m
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "SCAccountTableViewController.h"
#import "NSUserDefaults+SC.h"
#import "AppDelegate.h"
#import "UIColor+SC.h"
#import "UIFont+SC.h"
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory.h>
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory+iOS.h>
#import "UINavigationController+Ibiza.h"

@interface SCAccountTableViewController () {
    NIKFontAwesomeIconFactory *factory;
}

@end

@implementation SCAccountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[[self navigationController] setNavigationBarHidden:YES];
    [[self navigationController] setClear:YES];
    [self setupTableViewHeader];
    factory = [NIKFontAwesomeIconFactory tabBarItemIconFactory];
    [factory setColors:@[[UIColor lightGrayColor]]];
    [[self tableView] setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}

- (void)setupTableViewHeader {
    CGFloat padding = 16;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[self view] frame].size.width, 140)];
    UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake(padding, 30, [[self view] frame].size.width - (padding*2), 50)];
    [labelHeader setFont:[UIFont fontSourceSansProBold:30.0f]];
    [labelHeader setTextColor:[UIColor darkGrayColor]];
    [labelHeader setText:@"Account"];
    [headerView addSubview:labelHeader];
    UILabel *labelSubheader = [[UILabel alloc] initWithFrame:CGRectMake(padding, CGRectGetMaxY([labelHeader frame]), [[self view] frame].size.width - (padding*2), 30)];
    [labelSubheader setFont:[UIFont fontSourceSansProLight:16.0f]];
    [labelSubheader setTextColor:[UIColor lightGrayColor]];
    [labelSubheader setText:@"View and edit profile"];
    [headerView addSubview:labelSubheader];
    UIView *underline = [[UIView alloc] initWithFrame:CGRectMake(padding, CGRectGetMaxY([labelSubheader frame]) + padding, 100, 1)];
    [underline setBackgroundColor:[UIColor lightGrayColor]];
    [headerView addSubview:underline];
    [[self tableView] setTableHeaderView:headerView];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"accountCell" forIndexPath:indexPath];
    
    if ([indexPath row] == 0) {
        [[cell textLabel] setText:@"User"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[factory createImageForIcon:NIKFontAwesomeIconUser]];
        [cell setAccessoryView:imageView];
    } else if ([indexPath row] == 1) {
        [[cell textLabel] setText:@"Reset Onboarding"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[factory createImageForIcon:NIKFontAwesomeIconRefresh]];
        [cell setAccessoryView:imageView];
    } else if ([indexPath row] == 2) {
        [[cell textLabel] setText:@"Logout"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[factory createImageForIcon:NIKFontAwesomeIconSignOut]];
        [cell setAccessoryView:imageView];
    }
    
    [[cell detailTextLabel] setText:@""];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath row] == 0) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    } else if ([indexPath row] == 1) {
        [self buttonResetOnboardingPressed];
    } else if ([indexPath row] == 2) {
        [self buttonLogoutPressed];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)buttonResetOnboardingPressed {
    NSLog(@"Onboarding Reset");
    [NSUserDefaults setIsOnboardingComplete:NO];
    [NSUserDefaults setHasWelcomeMessageDisplayed:NO];
}

- (void)buttonLogoutPressed {
    NSLog(@"Logged Out");
    [NSUserDefaults setIsUserLoggedIn:NO];
    AppDelegate *appDelegateTemp = [[UIApplication sharedApplication] delegate];
    [[appDelegateTemp window] setRootViewController:[[UIStoryboard storyboardWithName:@"Onboarding" bundle:[NSBundle mainBundle]] instantiateInitialViewController]];
}

@end
