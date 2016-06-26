//
//  UIColor+SC.m
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "UIColor+SC.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation UIColor (SC)

+ (UIColor *)colorPrimary:(CGFloat)alpha {
    //return UIColorFromRGB(0x97BDFF);
    return [self colourGold:1.0f];
}

+ (UIColor *)colorSecondary:(CGFloat)alpha {
    return [UIColor colorWithRed:44.0/255.0 green:44.0/255.0 blue:44.0/255.0 alpha:alpha];
}

+ (UIColor *)colorTextPrimary:(CGFloat)alpha {
    return UIColorFromRGB(0x565a5c);
}

+ (UIColor *)colorTextSecondary:(CGFloat)alpha {
    return UIColorFromRGB(0x565a5c);
}

+ (UIColor *)colourGold:(CGFloat)alpha {
    return [UIColor colorWithRed:253.0/255.0 green:181.0/255.0 blue:21.0/255.0 alpha:1.0f];
}

@end
