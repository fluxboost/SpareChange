//
//  SCDonatedViewController.m
//  SpareChange
//
//  Created by Harry Liddell on 26/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "SCDonatedViewController.h"
#import "UIViewController+NavigationController.h"
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory.h>
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory+iOS.h>

@implementation SCDonatedViewController

+ (instancetype)createWithUsername:(NSString *)username andProductName:(NSString *)productName {
    UIStoryboard *storyboardMain = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    SCDonatedViewController *instance = (SCDonatedViewController *)[storyboardMain instantiateViewControllerWithIdentifier:NSStringFromClass([SCDonatedViewController class])];
    
    [instance setUsername:username];
    [instance setProductName:productName];

    return instance;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory tabBarItemIconFactory];
    [factory setColors:@[[UIColor greenColor]]];
    //[[self imageViewDonated] setImage:[factory createImageForIcon:NIKFontAwesomeIconCheckCircleO]];
    
    [self setNavBar:@"Thank you for donating!"];
    
    [[self labelSubHeader] setText:[[[self labelSubHeader] text] stringByReplacingOccurrencesOfString:@"{username}" withString:[self username]]];
    [[self labelSubHeader] setText:[[[self labelSubHeader] text] stringByReplacingOccurrencesOfString:@"{item}" withString:[[self productName] lowercaseString]]];
}

-(void)setNavBar:(NSString*)titleText {
    UIBarButtonItem *buttonCancel = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(cancelOrder:)];
    [[self navigationItem] setRightBarButtonItem:buttonCancel];
    [[self navigationItem] setTitle:titleText];
}

- (void)cancelOrder:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
