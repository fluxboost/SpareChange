//
//  SCTabBarController.m
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import "SCTabBarController.h"
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory.h>
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory+iOS.h>

@implementation SCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for(UITabBarItem * tabBarItem in self.tabBar.items){
        tabBarItem.title = @"";
        tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory tabBarItemIconFactory];
    UITabBarItem *item0 = self.tabBar.items[0];
    //item0.title = NSLocalizedString(@"Beaches", nil);
    item0.title = NSLocalizedString(@"", nil);
    item0.image = [factory createImageForIcon:NIKFontAwesomeIconHeartO];
    item0.selectedImage = [factory createImageForIcon:NIKFontAwesomeIconHeartO];
    
    UITabBarItem *item1 = self.tabBar.items[1];
    //item1.title = NSLocalizedString(@"Clubs", nil);
    item1.title = NSLocalizedString(@"", nil);
    item1.image = [factory createImageForIcon:NIKFontAwesomeIconBookmarkO];
    item1.selectedImage = [factory createImageForIcon:NIKFontAwesomeIconBookmarkO];
    
    UITabBarItem *item2 = self.tabBar.items[2];
    //item2.title = NSLocalizedString(@"Food", nil);
    item2.title = NSLocalizedString(@"", nil);
    item2.image = [factory createImageForIcon:NIKFontAwesomeIconBars];
    item2.selectedImage = [factory createImageForIcon:NIKFontAwesomeIconBars];
}

@end
