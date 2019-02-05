//
//  DuelViewController.h
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 22/01/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "ABFillButton.h"
#import "StageViewController.h"
@interface DuelViewController : UIViewController
@property (weak, nonatomic) NSString* strGenre;
@property NSString* scoreParse;
@property (strong, nonatomic) NSURL *theMovieURL;
@property (strong, nonatomic) MPMoviePlayerController * moviePlayerController;


@property(strong,nonatomic) NSArray* myarrayJ;
@property int testJ;

@property int score1;
@property int score2;
@property (weak,nonatomic)NSString * singJ;
@property (weak,nonatomic)NSString * singJ2;
@property (weak,nonatomic)NSString * singJ3;
@property (weak,nonatomic)NSString * singJ4;

@property (weak, nonatomic) IBOutlet UIButton *quitlbl;

@property (weak, nonatomic) IBOutlet UIButton *trylbl;


@property NSString* wrong_answer;
@property NSString* wrong_answer2;
@property NSString* wrong_answer3;
@property NSString* right_answer;
@property NSString* song_url;
@property int verif1;
 

- (IBAction)quit:(id)sender;

- (IBAction)retry:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *blue;
@property (weak, nonatomic) IBOutlet UILabel *yellow;


- (IBAction)prop1_P1:(id)sender;


- (IBAction)prop2_P1:(id)sender;

- (IBAction)prop3_P1:(id)sender;

- (IBAction)prop4_P1:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *score_P1;


@property (weak, nonatomic) IBOutlet UILabel *score_P2;


- (IBAction)prop1_P2:(id)sender;

- (IBAction)prop2_P2:(id)sender;

- (IBAction)prop3_P2:(id)sender;

- (IBAction)prop4_P2:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *lp1;


@property (weak, nonatomic) IBOutlet UIButton *lp2;


@property (weak, nonatomic) IBOutlet UIButton *lp3;



@property (weak, nonatomic) IBOutlet UIButton *lp4;



@property (weak, nonatomic) IBOutlet UIButton *rp1;

@property (weak, nonatomic) IBOutlet UIButton *rp2;


@property (weak, nonatomic) IBOutlet UIButton *rp3;


@property (weak, nonatomic) IBOutlet UIButton *rp4;



@end
