//
//  SCOnboardingViewController.m
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "SCOnboardingViewController.h"
#import "NSUserDefaults+SC.h"
#import "AppDelegate.h"
#import "UIColor+SC.h"
#import "UIFont+SC.h"

@interface SCOnboardingViewController ()

@end

@implementation SCOnboardingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[[self butonCreateAccount] layer] setCornerRadius:[[self butonCreateAccount] frame].size.height/2];
    [[[self butonCreateAccount] layer] setBorderWidth:1.0f];
    [[[self butonCreateAccount] layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    if (![NSUserDefaults isOnboardingCompleted]) {
        [self setupandShowIntro];
    }
}

#pragma mark - EAIntroView

- (void)setupandShowIntro {
    
    NSMutableArray *pages = [NSMutableArray array];
    NSArray *onboardingData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"OnboardingData" ofType:@"plist"]];
    
    for (NSDictionary *object in onboardingData) {
        EAIntroPage *page = [EAIntroPage page];
        page.title = [object objectForKey:@"titleText"];
        page.titleFont = [UIFont fontSourceSansProBold:24.0f];
        //page.titleFont = [UIFont pik_avenirNextBoldWithSize:18.0f];
        page.titleColor = [UIColor whiteColor];
        page.titlePositionY = 175.0f;
        page.desc = [object objectForKey:@"descText"];
        page.descFont = [UIFont fontSourceSansProLight:18.0f];
        page.descColor = [UIColor whiteColor];
        //page.descFont = [UIFont pik_avenirNextRegWithSize:14.0f];
        page.descPositionY = 175.0f;
        page.bgImage = [UIImage imageNamed:[object objectForKey:@"image"]];
        [pages addObject:page];
    }
    
    [self setIntro:[[EAIntroView alloc] initWithFrame:[[self view] bounds] andPages:pages]];
    [[self intro] setDelegate:self];
    [[self intro] setSkipButton:[self skipButton]];
    [[self intro] setSkipButtonAlignment:EAViewAlignmentCenter];
    [[self intro] setShowSkipButtonOnlyOnLastPage:YES];
    [[self intro] setPageControlY:100.0f];
    [[self intro] setUseMotionEffects:YES];
    [[self intro] setSwipeToExit:NO];
    [[self intro] showInView:[self view] animateDuration:1.0];
}

- (void)intro:(EAIntroView *)introView pageStartScrolling:(EAIntroPage *)page withIndex:(NSUInteger)pageIndex {
    
}

- (void)intro:(EAIntroView *)introView pageEndScrolling:(EAIntroPage *)page withIndex:(NSUInteger)pageIndex {
    
}

-(void)introDidFinish:(EAIntroView *)introView wasSkipped:(BOOL)wasSkipped {
    if (wasSkipped) {
        [NSUserDefaults setIsOnboardingComplete:NO];
    } else {
        [NSUserDefaults setIsOnboardingComplete:YES];
    }
}

- (UIButton *)skipButton {
    UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [skipButton setFrame:CGRectMake(0, 0, [[self view] frame].size.width/1.5, 60)];
    [skipButton setBackgroundColor:[UIColor colorPrimary:1.0f]];
    [skipButton setTitle:NSLocalizedString(@"Get Started", nil) forState:UIControlStateNormal];
    [[skipButton layer] setCornerRadius:5.0f];
    return skipButton;
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)buttonCreateAccountPressed:(id)sender {
    [NSUserDefaults setIsUserLoggedIn:YES];
    
    AppDelegate *appDelegateTemp = [[UIApplication sharedApplication] delegate];
    [[appDelegateTemp window] setRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController]];
}
@end
