
//
//  SCBookmarksTableViewController.m
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "SCBookmarksTableViewController.h"
#import "UIFont+SC.h"
#import "UIColor+SC.h"
#import "UINavigationController+Ibiza.h"
#import "NSUserDefaults+SC.h"

@implementation SCBookmarksTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setPeople:[NSUserDefaults bookmarks]];
    [[self navigationController] setClear:YES];
    [self setupTableViewHeader];
    [[self tableView] setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}

- (void)setupTableViewHeader {
    CGFloat padding = 16;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[self view] frame].size.width, 140)];
    UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake(padding, 30, [[self view] frame].size.width - (padding*2), 50)];
    [labelHeader setFont:[UIFont fontSourceSansProBold:30.0f]];
    [labelHeader setTextColor:[UIColor darkGrayColor]];
    [labelHeader setText:@"Bookmarks"];
    [headerView addSubview:labelHeader];
    UILabel *labelSubheader = [[UILabel alloc] initWithFrame:CGRectMake(padding, CGRectGetMaxY([labelHeader frame]), [[self view] frame].size.width - (padding*2), 30)];
    [labelSubheader setFont:[UIFont fontSourceSansProLight:14.0f]];
    [labelSubheader setTextColor:[UIColor lightGrayColor]];
    [labelSubheader setText:@"View the people you donate to regularly"];
    [headerView addSubview:labelSubheader];
    UIView *underline = [[UIView alloc] initWithFrame:CGRectMake(padding, CGRectGetMaxY([labelSubheader frame]) + padding, 100, 1)];
    [underline setBackgroundColor:[UIColor lightGrayColor]];
    [headerView addSubview:underline];
    [[self tableView] setTableHeaderView:headerView];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookmarkCell" forIndexPath:indexPath];
    
    if(!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookmarkCell"];
    }
    
    [[cell textLabel] setFont:[UIFont fontSourceSansProLight:18.0f]];
    [[cell textLabel] setTextColor:[UIColor darkGrayColor]];
    
    [[cell textLabel] setText:[[[self people] objectAtIndex:[indexPath row]] valueForKey:@"handle"]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self people] count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
