//
//  SharingController.h
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 15/02/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
@interface SharingController : UIViewController
@property(strong,nonatomic) DBManager *DB;
@property(strong,nonatomic) NSArray *shareFavoris;

@end
