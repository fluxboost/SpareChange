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

@interface SCOnboardingViewController ()

@end

@implementation SCOnboardingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
        page.titleFont = [UIFont systemFontOfSize:18.0f weight:UIFontWeightBold];
        //page.titleFont = [UIFont pik_avenirNextBoldWithSize:18.0f];
        page.titleColor = [UIColor darkGrayColor];
        page.titlePositionY = 175.0f;
        page.desc = [object objectForKey:@"descText"];
        page.descFont = [UIFont systemFontOfSize:14.0f weight:UIFontWeightLight];
        page.descColor = [UIColor lightGrayColor];
        //page.descFont = [UIFont pik_avenirNextRegWithSize:14.0f];
        page.descPositionY = 175.0f;
        page.bgColor = [UIColor orangeColor];
        [pages addObject:page];
    }
    
    [self setIntro:[[EAIntroView alloc] initWithFrame:[[self view] bounds] andPages:pages]];
    [[self intro] setDelegate:self];
    [[self intro] setSkipButton:[self skipButton]];
    [[self intro] setSkipButtonAlignment:EAViewAlignmentCenter];
    [[self intro] setPageControlY:100.0f];
    
    [[self intro] setUseMotionEffects:YES];
    [[self intro] setSwipeToExit:NO];
    [[self intro] showInView:[self view] animateDuration:1.0];
    //[self performSelector:@selector(shiftPageWithIndex:) withObject:[NSNumber numberWithInteger:0] afterDelay:3.0];
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
    [skipButton setFrame:CGRectMake(0, 0, [[self view] frame].size.width/2, 50)];
    [skipButton setBackgroundColor:[UIColor redColor]];
    [skipButton setTitle:NSLocalizedString(@"Get Started", nil) forState:UIControlStateNormal];
    [[skipButton layer] setCornerRadius:5.0f];
    [[skipButton layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[skipButton layer] setBorderWidth:2.0f];
    return skipButton;
}


- (IBAction)buttonLoginPressed:(id)sender {
    [NSUserDefaults setIsUserLoggedIn:YES];
    
    AppDelegate *appDelegateTemp = [[UIApplication sharedApplication] delegate];
    [[appDelegateTemp window] setRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController]];

}
@end
