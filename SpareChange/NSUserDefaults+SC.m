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

+ (BOOL)hasWelcomeMessageDisplayed {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [[userDefaults objectForKey:scWelcomeMessageDisplayed] boolValue];
}

+ (void)setHasWelcomeMessageDisplayed:(BOOL)hasDisplayed {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSNumber numberWithBool:hasDisplayed] forKey:scIsUserLoggedIn];
    [userDefaults synchronize];
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

+ (void)addPersonToBookmarks:(NSDictionary *)person {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *bookmarks = [[self bookmarks] mutableCopy];
    
    if (!bookmarks) {
        bookmarks = [NSMutableArray array];
    }
    
    [bookmarks addObject:person];
    [userDefaults setObject:[bookmarks copy] forKey:scBookmarks];
    [userDefaults synchronize];
}

+ (void)removePersonFromBookmarks:(NSDictionary *)person {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *bookmarks = [[self bookmarks] mutableCopy];
    
    if (!bookmarks) {
        bookmarks = [NSMutableArray array];
    }
    
    [bookmarks removeObject:person];
    [userDefaults setObject:[bookmarks copy] forKey:scBookmarks];
    [userDefaults synchronize];
}


+ (NSArray *)bookmarks {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:scBookmarks];
}

@end
