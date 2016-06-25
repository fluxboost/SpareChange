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
    item0.image = [factory createImageForIcon:NIKFontAwesomeIconSunO];
    item0.selectedImage = [factory createImageForIcon:NIKFontAwesomeIconSunO];
    
    UITabBarItem *item1 = self.tabBar.items[1];
    //item1.title = NSLocalizedString(@"Clubs", nil);
    item1.title = NSLocalizedString(@"", nil);
    item1.image = [factory createImageForIcon:NIKFontAwesomeIconGlass];
    item1.selectedImage = [factory createImageForIcon:NIKFontAwesomeIconGlass];
    
    UITabBarItem *item2 = self.tabBar.items[2];
    //item2.title = NSLocalizedString(@"Food", nil);
    item2.title = NSLocalizedString(@"", nil);
    item2.image = [factory createImageForIcon:NIKFontAwesomeIconCutlery];
    item2.selectedImage = [factory createImageForIcon:NIKFontAwesomeIconCutlery];
    
    UITabBarItem *item3 = self.tabBar.items[3];
    //item3.title = NSLocalizedString(@"Transport", nil);
    item3.title = NSLocalizedString(@"", nil);
    item3.image = [factory createImageForIcon:NIKFontAwesomeIconTaxi];
    item3.selectedImage = [factory createImageForIcon:NIKFontAwesomeIconTaxi];
    
    UITabBarItem *item4 = self.tabBar.items[4];
    //item4.title = NSLocalizedString(@"Safety", nil);
    item4.title = NSLocalizedString(@"", nil);
    item4.image = [factory createImageForIcon:NIKFontAwesomeIconHeartbeat];
    item4.selectedImage = [factory createImageForIcon:NIKFontAwesomeIconHeartbeat];
}

@end
