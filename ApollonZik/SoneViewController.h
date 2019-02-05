//
//  SoneViewController.h
//  ApollonZik
//
//  Created by Gothi on 02/12/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "ABFillButton.h"
#import "StageViewController.h"
#import "MozTopAlertView.h"
#import "DBManager.h"
#import "EndViewController.h"

@interface SoneViewController : UIViewController <ABFillButtonDelegate>

@property (weak, nonatomic) NSString* strGenre;
@property NSString* scoreParse;
@property (strong, nonatomic) NSURL *theMovieURL;
@property (strong, nonatomic) MPMoviePlayerController * moviePlayerController;
- (IBAction)b11:(id)sender;
- (IBAction)b12:(id)sender;
- (IBAction)b14:(id)sender;
- (IBAction)testCont:(id)sender;
@property(weak,nonatomic)NSString*ser;
@property(weak,nonatomic)NSString*der;
@property(strong,nonatomic) NSMutableArray *linkArray;
@property (weak, nonatomic) IBOutlet UIButton *itune;

@property(strong,nonatomic) NSMutableArray *SingerArray;

@property (weak,nonatomic)NSString * genre;
@property (weak, nonatomic) IBOutlet UIButton *quitlbl;

- (IBAction)quitbt:(id)sender;


@property(strong,nonatomic) DBManager *DB;
- (IBAction)b13:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UILabel *ScoreAffich;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UIButton *b4;
@property (weak, nonatomic) IBOutlet UIImageView *lifeO3;
@property (weak, nonatomic) IBOutlet UIImageView *lifeO2;
@property (weak, nonatomic) IBOutlet UIButton *btnRetry;
@property(strong,nonatomic) NSArray* myarrayJ;
@property int testJ;
@property (weak,nonatomic)NSString * singJ;
@property int score;
@property (weak,nonatomic)NSString * singJ2;
@property (weak,nonatomic)NSString * singJ3;
@property (weak,nonatomic)NSString * singJ4;
@property NSString* wrong_answer;
@property NSString* wrong_answer2;
@property NSString* wrong_answer3;
@property NSString* right_answer;
@property NSString* song_url;
@property int verif1;
@property int lives3;
- (IBAction)btnRet:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *lifeO1;
@end
