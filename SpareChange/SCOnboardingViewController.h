//
//  SCOnboardingViewController.h
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EAIntroView/EAIntroView.h>

@interface SCOnboardingViewController : UIViewController <EAIntroDelegate>

@property (strong, nonatomic) EAIntroView *intro;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;

- (IBAction)buttonLoginPressed:(id)sender;

@end
