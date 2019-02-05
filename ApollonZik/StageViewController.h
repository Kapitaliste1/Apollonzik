//
//  StageViewController.h
//  ApollonZik
//
//  Created by Gothi on 02/12/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "SoneViewController.h"
#import "DBManager.h"

@interface StageViewController : UIViewController
- (IBAction)btnBack:(id)sender;
@property NSString * genreType;
@property (weak, nonatomic) IBOutlet UIImageView *profileFBpic;
- (IBAction)RockBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *background;
- (IBAction)CountryBtn:(id)sender;
- (IBAction)ReggaeBtn:(id)sender;
- (IBAction)RnbBtn:(id)sender;
- (IBAction)Jazz:(id)sender;
- (IBAction)PopBtn:(id)sender;
- (IBAction)RemixBtn:(id)sender;

@property(strong,nonatomic) NSArray *Mytab;

@property(strong,nonatomic) DBManager *DB;
@end
