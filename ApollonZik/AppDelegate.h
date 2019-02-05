//
//  AppDelegate.h
//  ApollonZik
//
//  Created by Gothi Musix on 20/11/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DBManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic) NSArray* myarray2;
@property(strong,nonatomic) DBManager *DB;
@property(strong,nonatomic) NSArray* myarray;
@property(strong,nonatomic) NSString * lyric;








@end

