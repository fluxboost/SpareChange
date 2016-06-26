//
//  SCDonateViewController.m
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "SCDonateViewController.h"
#import "UINavigationController+Ibiza.h"
#import "UIFont+SC.h"
#import "UIColor+SC.h"
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory.h>
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory+iOS.h>
#import <Slash/Slash.h>
#import "SCInfoViewController.h"
#import "SpareChange-swift.h"
#import "UINavigationController+Ibiza.h"
#import "NSUserDefaults+SC.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface SCDonateViewController () {
    NSMutableArray *searchArray;
    NSString *searchTextString;
    BOOL isFilter;
    NIKFontAwesomeIconFactory *factory;
    UIView *viewBackground;
    UIView *viewTextBox;
    UILabel *labelTextBoxText;
    UIButton *buttonDonate;
    NSDictionary *userSelected;
    SpareChangeAPI *api;
    NSArray *data;
    MBProgressHUD *hud;
}

@end

@implementation SCDonateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[[self navigationController] setNavigationBarHidden:YES];
    [[self navigationController] setClear:YES];
    
    api = [[SpareChangeAPI alloc] init];
    
    data = [api homeless];
    
    [self showDonateScreen];
    
    factory = [NIKFontAwesomeIconFactory tabBarItemIconFactory];
    [factory setColors:@[[UIColor lightGrayColor]]];
    
    isFilter = NO;
    //arrayColour = [NSMutableArray arrayWithObjects:@"Red",@"Green",@"Blue",@"Gray",@"Black",@"White",@"Yellow",@"Brown",@"Pink",nil];
    [[self imageViewSearch] setImage:[factory createImageForIcon:NIKFontAwesomeIconSearch]];
    [[self textFieldSearch] setDelegate:self];
    [[self textFieldSearch] addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[[self navigationController] setNavigationBarHidden:YES];
    [[self navigationController] setClear:YES];
}

- (void)showDonateScreen {
    CGRect frame = CGRectMake(0, -500, [[self view] frame].size.width, [[self view] frame].size.height);
    viewBackground = [[UIView alloc] initWithFrame:frame];
    [viewBackground setBackgroundColor:[UIColor colorPrimary:1.0f]];
    CGRect baseFrame = [[self view] frame];
    
     viewTextBox = [[UIView alloc] initWithFrame:CGRectMake(baseFrame.size.width/2 - 100, baseFrame.size.height/2 - 100, 250, 300)];
    [viewTextBox setBackgroundColor:[UIColor blackColor]];

     labelTextBoxText = [[UILabel alloc] initWithFrame:CGRectMake(16, 16, [viewTextBox frame].size.width - 32,  [viewTextBox frame].size.width - 32)];
    [labelTextBoxText setNumberOfLines:0];
    [labelTextBoxText setAttributedText:[SLSMarkupParser attributedStringWithMarkup:@"<strong>Hello and welcome to SpareChange!</strong>\nWe are incredibly grateful you've decided to join us in aiding the homeless community where others wouldn't. Using this app we hope to encourage people to donate safely to those in need. Are you ready?" style:[self markup] error:NULL]];
    [labelTextBoxText setTextColor:[UIColor whiteColor]];
    [labelTextBoxText sizeToFit];
    
    UIImageView *imageViewIcon = [[UIImageView alloc] initWithFrame:CGRectMake(32, 32, 100, 100)];
    [imageViewIcon setImage:[UIImage imageNamed:@"SpareChange_Logo_Black"]];
    [imageViewIcon setContentMode:UIViewContentModeScaleAspectFit];
    [viewBackground addSubview:imageViewIcon];
    
    buttonDonate = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonDonate setFrame:CGRectMake(16, CGRectGetHeight([viewTextBox frame]) - 16 - 50, CGRectGetWidth([labelTextBoxText frame]), 50)];
    [buttonDonate setTitle:@"LET'S DONATE" forState:UIControlStateNormal];
    [buttonDonate addTarget:self action:@selector(buttonDonatePressed) forControlEvents:UIControlEventTouchUpInside];
    [[buttonDonate titleLabel] setFont:[UIFont fontSourceSansProBold:20.0f]];
    
    [viewTextBox addSubview:buttonDonate];
    [viewTextBox addSubview:labelTextBoxText];
    [viewBackground addSubview:viewTextBox];
    [[self view] addSubview:viewBackground];
    
    [UIView animateWithDuration:1.0 animations:^{
        [viewBackground setCenter:CGPointMake([[self view] frame].size.width/2, [[self view] frame].size.height/2)];
    } completion:^(BOOL finished) {
    }];
}

- (NSDictionary *)markup {
     return @{ @"$default" : @{NSFontAttributeName  : [UIFont fontSourceSansProLight:14.0f]},
               @"strong"   : @{NSFontAttributeName  : [UIFont fontSourceSansProBold:22.0f]}
            };
}

- (void)buttonDonatePressed {
    [UIView animateWithDuration:1.0 animations:^{
        [viewBackground setCenter:CGPointMake([viewBackground frame].size.width/2, 1500)];
    } completion:^(BOOL finished) {
        [NSUserDefaults setHasWelcomeMessageDisplayed:YES];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(isFilter) {
        return [searchArray count];
    }
    
    return [data count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"donateCell"];
    
    if(!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"donateCell"];
    }
    
    [[cell textLabel] setFont:[UIFont fontSourceSansProBold:18.0f]];
    [[cell detailTextLabel] setFont:[UIFont fontSourceSansProLight:14.0f]];
    [[cell textLabel] setTextColor:[UIColor darkGrayColor]];
    [[cell detailTextLabel] setTextColor:[UIColor darkGrayColor]];
    
    if(isFilter) {
        [[cell textLabel] setText:[[searchArray objectAtIndex:[indexPath row]] valueForKey:@"handle"]];
        [[cell detailTextLabel] setText:[[searchArray objectAtIndex:[indexPath row]] valueForKey:@"location"]];
    } else {
        [[cell textLabel] setText:[[data objectAtIndex:[indexPath row]] valueForKey:@"handle"]];
        [[cell detailTextLabel] setText:[[data objectAtIndex:[indexPath row]] valueForKey:@"location"]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (isFilter) {
        userSelected = [searchArray objectAtIndex:[indexPath row]];
    } else {
        userSelected = [data objectAtIndex:[indexPath row]];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (![userSelected valueForKey:@"wishList"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Info" message:@"Unfortunately this person doesn't have a wishlist set at the moment, please check back later." preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        [[self textFieldSearch] resignFirstResponder];
        return;
    }
    
    [[self textFieldSearch] resignFirstResponder];
    [self performSegueWithIdentifier:@"toInfoSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toInfoSegue"]) {
        SCInfoViewController *destinationViewController = (SCInfoViewController *)[segue destinationViewController];
        [destinationViewController setPerson:userSelected];
    }
}

-(void)updateSearchArray:(NSString *)searchText {
    
    if ([searchText length] > 0) {
        if ([[searchText substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"@"]) {
            searchText = [searchText stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
        }
    }
    
    if(([searchText length] == 0) || ([searchText length] == 1 && [searchText isEqualToString:@"@"])) {
        isFilter = NO;
    } else {
        [self displayButtonVisible:YES];
        isFilter = YES;
        searchArray = [[NSMutableArray alloc] init];
        for(NSDictionary *person in data) {
            NSString *username = [person valueForKey:@"handle"];
            NSRange stringRange = [username rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location != NSNotFound){
                [searchArray addObject:person];
            }
        }
    }
    
    [[self tableView] reloadData];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([[textField text] length] == 0) {
        [textField setText:@"@"];
    }
}

- (void)displayButtonVisible:(BOOL)isVisible {
    
    if (isVisible) {
        UIBarButtonItem *buttonReset = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStyleDone target:self action:@selector(buttonResetPressed)];
        [buttonReset setTintColor:[UIColor lightGrayColor]];
        [[self navigationItem] setRightBarButtonItem:buttonReset];
    } else {
        [[self navigationItem] setRightBarButtonItem:nil];
    }
}

- (void)buttonResetPressed {
    [[self textFieldSearch] setText:@""];
    [[self textFieldSearch] resignFirstResponder];
    isFilter = NO;
    [[self tableView] reloadData];
    [self displayButtonVisible:NO];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidChange:(UITextField *)textField {
    
    searchTextString = [textField text];
    [self updateSearchArray:searchTextString];
    
    if ([[textField text] length] == 0) {
        [textField setText:[@"@" stringByAppendingString:[textField text]]];
    }
    
    if ([[textField text] length] > 0) {
        if (![[[textField text] substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"@"]) {
            [textField setText:[@"@" stringByAppendingString:[textField text]]];
        }
    }
}

@end
