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
+ (void)setIsUserLoggedIn:(BOOL)isLoggedIn;
+ (void)setIsOnboardingComplete:(BOOL)isOnboardingComplete;

@end
