//
//  JazzViewController.h
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 06/12/15.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZTimerLabel.h"
#import "DBManager.h"
#import "WebViewController.h"
#import "StageViewController.h"
#import "EndViewController.h"
@interface JazzViewController : UIViewController
{
    
    NSTimer *timer;
    MZTimerLabel *timerExample6;
}
@property (weak, nonatomic) IBOutlet UILabel *CountDown;
@property (weak, nonatomic) IBOutlet UILabel *Score;
@property (weak, nonatomic) IBOutlet UILabel *LyricShow;
@property (weak, nonatomic) IBOutlet UIButton *Proposition1;
@property (weak, nonatomic) IBOutlet UIButton *Proposition2;
@property (weak, nonatomic) IBOutlet UIButton *Proposition3;
@property (weak, nonatomic) IBOutlet UIButton *Proposition4;
@property (weak, nonatomic) IBOutlet UIImageView *life1;
@property (weak, nonatomic) IBOutlet UIImageView *life2;
@property (weak, nonatomic) IBOutlet UIImageView *life3;
- (IBAction)prop1:(id)sender;
- (IBAction)prop2:(id)sender;
- (IBAction)prop3:(id)sender;
- (IBAction)prop4:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *favZap;


@property (weak, nonatomic) IBOutlet UIButton *pauseZap;

- (IBAction)pause:(id)sender;

@property (weak,nonatomic)NSString * genre;
@property (weak,nonatomic)NSString * link;

@property (weak, nonatomic) IBOutlet UIButton *buy;

@property (weak, nonatomic) IBOutlet UITableView *mytab;


@property int finaliseur;
@property(strong,nonatomic) NSArray* myarray;
@property (weak,nonatomic)NSString * sing;
@property(weak, nonatomic) NSString * titl;
@property(weak,nonatomic)NSString*ser;
@property(weak,nonatomic)NSString*der;
@property(weak, nonatomic) NSString * li;
@property int test;
@property int f1;
@property int f2;
@property int f3;
@property(strong,nonatomic) NSArray * chfd ;
@property(strong, nonatomic) NSString * xnx;
@property int but;
@property int verif1;
@property int life;
@property NSString* wrong_answer;
@property NSString* wrong_answer3;
@property NSString* wrong_answer2;
@property NSString* right_answer;
@property (weak, nonatomic) IBOutlet UILabel *FinaleScore;
@property (weak, nonatomic) IBOutlet UIButton *quit;
@property (weak, nonatomic) IBOutlet UIButton *retry;
 - (IBAction)favoris:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *red;

@property (weak, nonatomic) IBOutlet UIImageView *green;



@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;

@property(strong,nonatomic) NSMutableArray *linkArray;

@property(strong,nonatomic) NSMutableArray *SingerArray;

@property(strong,nonatomic) DBManager *DB;
@end
