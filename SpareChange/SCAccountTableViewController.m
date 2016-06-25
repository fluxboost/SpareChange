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

@interface SCAccountTableViewController ()

@end

@implementation SCAccountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableViewHeader];
}

- (void)setupTableViewHeader {
    CGFloat padding = 16;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[self view] frame].size.width, 150)];
    UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake(padding, 30, [[self view] frame].size.width - (padding*2), 60)];
    [labelHeader setFont:[UIFont systemFontOfSize:52.0f]];
    [labelHeader setTextColor:[UIColor darkGrayColor]];
    [labelHeader setText:@"Account"];
    [headerView addSubview:labelHeader];
    UILabel *labelSubheader = [[UILabel alloc] initWithFrame:CGRectMake(padding, CGRectGetMaxY([labelHeader frame]), [[self view] frame].size.width - (padding*2), 30)];
    [labelSubheader setFont:[UIFont systemFontOfSize:14.0f]];
    [labelSubheader setTextColor:[UIColor lightGrayColor]];
    [labelSubheader setText:@"View and edit profile"];
    [headerView addSubview:labelSubheader];
    [[self tableView] setTableHeaderView:headerView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([[cell reuseIdentifier] isEqualToString:@"username"]) {
        
    } else if ([[cell reuseIdentifier] isEqualToString:@"resetOnboarding"]) {
        [self buttonResetOnboardingPressed];
    } else if ([[cell reuseIdentifier] isEqualToString:@"logout"]) {
        [self buttonLogoutPressed];
    }
}

- (void)buttonResetOnboardingPressed {
    NSLog(@"Onboarding Reset");
    [NSUserDefaults setIsOnboardingComplete:NO];
}

- (void)buttonLogoutPressed {
    NSLog(@"Logged Out");
    [NSUserDefaults setIsUserLoggedIn:NO];
    AppDelegate *appDelegateTemp = [[UIApplication sharedApplication] delegate];
    [[appDelegateTemp window] setRootViewController:[[UIStoryboard storyboardWithName:@"Onboarding" bundle:[NSBundle mainBundle]] instantiateInitialViewController]];
}

@end
