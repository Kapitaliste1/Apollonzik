//
//  ScoreViewController.h
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 03/01/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "StageViewController.h"

@interface ScoreViewController : UIViewController
@property(strong,nonatomic) DBManager *DB;



- (IBAction)shareBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *testimg;


@property (weak, nonatomic) IBOutlet UILabel *LJAZZ;
@property (weak, nonatomic) IBOutlet UILabel *LCOUNTRY;
@property (weak, nonatomic) IBOutlet UILabel *LPOP;
@property (weak, nonatomic) IBOutlet UILabel *LREAGGAE;
@property (weak, nonatomic) IBOutlet UILabel *LRNB;
@property (weak, nonatomic) IBOutlet UILabel *LROCK;


@property (weak, nonatomic) IBOutlet UILabel *MJAZZ;
@property (weak, nonatomic) IBOutlet UILabel *MCOUNTRY;
@property (weak, nonatomic) IBOutlet UILabel *MPOP;
@property (weak, nonatomic) IBOutlet UILabel *MREGGAE;
@property (weak, nonatomic) IBOutlet UILabel *MRNB;
@property (weak, nonatomic) IBOutlet UILabel *MROCK;







@end
