//
//  AppDelegate.m
//  SpareChange
//
//  Created by Harry Liddell on 24/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "AppDelegate.h"
#import "NSUserDefaults+SC.h"
#import "UIFont+SC.h"
#import "UIColor+SC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupAppearance];
    [NSUserDefaults setHasWelcomeMessageDisplayed:YES];
    [NSUserDefaults setIsUserLoggedIn:NO];
    
    if ([NSUserDefaults isUserLoggedIn]) {
        [[self window] setRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController]];
    } else {
        [[self window] setRootViewController:[[UIStoryboard storyboardWithName:@"Onboarding" bundle:[NSBundle mainBundle]] instantiateInitialViewController]];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)setupAppearance {
    //UIImage *backButtonIcon = [self imageWithImage:[UIImage imageNamed:@"backArrow.png"] scaledToSize:CGSizeMake(36, 36)];
    //[[UINavigationBar appearance] setBackIndicatorImage:[backButtonIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    //[[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[backButtonIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor colorPrimary:1.0f]];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor], NSBackgroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont fontSourceSansProLight:16.0f]}];
    //[[UINavigationBar appearance] setClipsToBounds:YES];
    
    // Hides back button text
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTintColor:[UIColor colorPrimary:1.0f]];
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBarItem appearance] setTitleTextAttributes: @{ NSFontAttributeName : [UIFont systemFontOfSize:9.0f]} forState:UIControlStateNormal];
}

@end
