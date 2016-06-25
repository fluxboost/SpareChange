//
//  UINavigationController+Ibiza.m
//  Ibiza
//
//  Created by Harry Liddell on 26/05/2016.
//  Copyright © 2016 57Digital. All rights reserved.
//

#import "UINavigationController+Ibiza.h"

@implementation UINavigationController (Ibiza)

- (void)setClear:(BOOL)clear {
    if (clear) {
        [[self navigationBar] setBackgroundImage:[UIImage new]
                                                      forBarMetrics:UIBarMetricsDefault];
        [[self navigationBar] setShadowImage:[UIImage new]];
        [[self navigationBar] setTranslucent:YES];
        [[self view] setBackgroundColor:[UIColor clearColor]];
        [[self navigationBar] setBackgroundColor:[UIColor clearColor]];
    } else {
        [[self navigationBar] setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [[self navigationBar] setTranslucent:NO];
    }
}


@end
