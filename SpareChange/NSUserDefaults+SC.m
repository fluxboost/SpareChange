//
//  NSUserDefaults+SC.m
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "NSUserDefaults+SC.h"
#import "Constants.h"

@implementation NSUserDefaults (SC)

+ (BOOL)isUserLoggedIn {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [[userDefaults objectForKey:scIsUserLoggedIn] boolValue];
}

+ (BOOL)isOnboardingCompleted {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [[userDefaults objectForKey:scIsOnboardingCompleted] boolValue];
}

+ (void)setIsUserLoggedIn:(BOOL)isLoggedIn {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSNumber numberWithBool:isLoggedIn] forKey:scIsUserLoggedIn];
    [userDefaults synchronize];
}

+ (void)setIsOnboardingComplete:(BOOL)isOnboardingComplete {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSNumber numberWithBool:isOnboardingComplete] forKey:scIsOnboardingCompleted];
    [userDefaults synchronize];
}

@end
