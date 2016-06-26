//
//  SCDonatedViewController.h
//  SpareChange
//
//  Created by Harry Liddell on 26/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCDonatedViewController : UIViewController

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *productName;
@property (weak, nonatomic) IBOutlet UILabel *labelSubHeader;
@property (weak, nonatomic) IBOutlet UILabel *labelHeader;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDonated;

+ (instancetype)createWithUsername:(NSString *)username andProductName:(NSString *)productName;

@end
