//
//  UIFont+SC.m
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "UIFont+SC.h"

@implementation UIFont (SC)

+ (UIFont *)fontSourceSansProExtraLight:(CGFloat)fontSize {
    return [UIFont fontWithName:@"SourceSansPro-ExtraLight" size:fontSize];
}

+ (UIFont *)fontSourceSansProLight:(CGFloat)fontSize {
    return [UIFont fontWithName:@"SourceSansPro-Light" size:fontSize];
}

+ (UIFont *)fontSourceSansProRegular:(CGFloat)fontSize {
    return [UIFont fontWithName:@"SourceSansPro-Regular" size:fontSize];
}

+ (UIFont *)fontSourceSansProBold:(CGFloat)fontSize {
    return [UIFont fontWithName:@"SourceSansPro-Bold" size:fontSize];
}

@end
