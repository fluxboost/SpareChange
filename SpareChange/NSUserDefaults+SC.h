//
//  NSUserDefaults+SC.h
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (SC)

+ (BOOL)isUserLoggedIn;
+ (BOOL)isOnboardingCompleted;
+ (BOOL)hasWelcomeMessageDisplayed;

+ (void)setHasWelcomeMessageDisplayed:(BOOL)hasDisplayed;
+ (void)setIsUserLoggedIn:(BOOL)isLoggedIn;
+ (void)setIsOnboardingComplete:(BOOL)isOnboardingComplete;

+ (void)removePersonFromBookmarks:(NSDictionary *)person;
+ (NSArray *)bookmarks;
+ (void)addPersonToBookmarks:(NSDictionary *)person;

@end
