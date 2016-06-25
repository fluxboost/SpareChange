//
//  SCInfoViewController.h
//  SpareChange
//
//  Created by Harry Liddell on 25/06/2016.
//  Copyright © 2016 SpareChange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCInfoViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSDictionary *person;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
