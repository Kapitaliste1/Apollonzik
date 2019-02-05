//
//  SoneViewController.m
//  ApollonZik
//
//  Created by Gothi on 02/12/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import "SoneViewController.h"
#import <Parse/Parse.h>
#import "MozTopAlertView.h"

@interface SoneViewController (){
    float _numberOfPulses;}
@property (weak, nonatomic) IBOutlet ABFillButton *playButton;

@end
int ccc;
int timercount;
int timercountdown;
NSTimer *timerdown;
NSTimer *timer;
NSTimer* timer2;
NSTimer* timerForPlay;
NSString * URLString2;
NSString *logState;
@implementation SoneViewController

- (void)viewDidLoad {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    logState = [defaults objectForKey:@"log_state"];
    
    [super viewDidLoad];
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"Appollon"];
    [self.playButton setHidden:false];
    self.SingerArray = [[NSMutableArray alloc] init];
    self.linkArray = [[NSMutableArray alloc] init];
    _verif1=0;
    _lives3 = 3;
    _score = 0;
    _ScoreAffich.text = [[NSNumber numberWithInt:_score] stringValue];
    // Do any additional setup after loading the view.
    _btnRetry.hidden = true;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieEventFullscreenHandler:)
                                                 name:MPMoviePlayerWillEnterFullscreenNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieEventFullscreenHandler:)
                                                 name:MPMoviePlayerDidEnterFullscreenNotification
                                               object:nil];
    
    
    //_scoreParse= [[[NSUserDefaults standardUserDefaults] objectForKey:@"idFB"] stringValue];
    [self connectedToInternet];
    if ([URLString2  isEqual: @"connected"]) {
        
        [self loadMusixOuss];
    }else{
        
        UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SoneViewController *vc =[mainS instantiateViewControllerWithIdentifier:@"home"];
        [self.navigationController pushViewController: vc animated:NO];
    }
    
    
}
-(void)parseCompteScore{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //START
    if ([logState isEqual:@"connected"]){
        PFQuery *query = [PFQuery queryWithClassName:@"Users"];
        [query whereKey:@"fb_id" equalTo:[defaults objectForKey:@"idFB"]];
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            NSString *scoreGenre;
            if([self.strGenre  isEqual: @"21"]){
                scoreGenre = @"scoreRock";
            }else if([self.strGenre  isEqual: @"6"]){
                scoreGenre = @"scoreCountry";
            }else if([self.strGenre  isEqual: @"24"]){
                scoreGenre = @"scoreReggae";
            }else if([self.strGenre  isEqual: @"15"]){
                scoreGenre = @"scoreRnb";
            }else if([self.strGenre  isEqual: @"11"]){
                scoreGenre = @"scoreJazz";
            }else if([self.strGenre  isEqual: @"14"]){
                scoreGenre = @"scorePop";
            }
            if(objects.count==1)
            {
                if(objects[0][scoreGenre]<[NSNumber numberWithInt:(_score)]){
                    objects[0][scoreGenre] = [NSNumber numberWithInt:(_score)];
                    [objects[0] saveInBackground];
                }
            }
        }];
    }
}




- (BOOL) connectedToInternet
{
    URLString2 = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"] encoding:NSASCIIStringEncoding error:nil];
    if (URLString2!= NULL) {
        URLString2 = @"connected";
        return YES;
    }else{
        URLString2 = @"not connected";
        return NO;
    }
}
-(void)parsGetOuss{
    
    //BLOCK PARSING
    
    //BLOCK GET DATA FROM iTunes
    NSError *error = nil;
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL   URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/fr/rss/topsongs/limit=30/genre=%@/json",self.genre]]];
    
    //  NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL   URLWithString:@"https://itunes.apple.com/fr/rss/topsongs/limit=160/genre=21/json"]];
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    _myarrayJ =[[jsonObjects objectForKey:@"feed"]objectForKey:@"entry"];
    
    //END BLOCK GET DATA FROM iTunes
    //BLOCK GET RANDOM SONG number
     
    //RIGHT ONE
    float rndValue = arc4random_uniform(30);
    _testJ = [[NSNumber numberWithFloat:rndValue]intValue];
    //WRONG ONES
    float fake1 = arc4random_uniform(30);
    while (fake1==rndValue) {
        fake1 = arc4random_uniform(30);
    }
    
    float fake2 = arc4random_uniform(30);
    while (fake2==rndValue || fake2==fake1) {
        fake2 = arc4random_uniform(30);
    }
    float fake3 = arc4random_uniform(30);
    while (fake3==rndValue || fake3==fake1 || fake3 == fake2) {
        fake3 = arc4random_uniform(30);
    }
    //END BLOCK GET RANDOM SONG number
    //BLOCK get SONG HREF
    //RIGHT ONE
    NSArray * kola = [[_myarrayJ objectAtIndex:_testJ]objectForKey:@"link"];
    NSString * kas = [[[kola objectAtIndex:1]objectForKey:@"attributes"]objectForKey:@"href"];
    [self.linkArray addObject:[NSString stringWithFormat:@"%@ ",[[[[[_myarrayJ objectAtIndex:_testJ]objectForKey:@"im:collection"]objectForKey:@"link"]objectForKey:@"attributes"]objectForKey:@"href"]]];
    NSLog(@"%@",self.linkArray);
    _song_url=kas;//NO WRONG NEEDED
    //BLOCK get SONG HREF
    //RIGHT ONE
    _ser =[[[_myarrayJ objectAtIndex:_testJ]objectForKey:@"im:name"]objectForKey:@"label"];
    
    
    
    _der =[[[_myarrayJ objectAtIndex:_testJ]objectForKey:@"im:artist"]objectForKey:@"label"];
    
    
    
    
    _singJ =[[[_myarrayJ objectAtIndex:_testJ]objectForKey:@"title"]objectForKey:@"label"];
    //WRONG ONES
    _singJ2 =[[[_myarrayJ objectAtIndex:fake1]objectForKey:@"title"]objectForKey:@"label"];
    _singJ3 =[[[_myarrayJ objectAtIndex:fake2]objectForKey:@"title"]objectForKey:@"label"];
    _singJ4 =[[[_myarrayJ objectAtIndex:fake3]objectForKey:@"title"]objectForKey:@"label"];
    //END BLOCK PARSING
    _right_answer= _singJ;
    [self.SingerArray addObject:[NSString stringWithFormat:@"%@ ",_right_answer]];
    _wrong_answer= _singJ2;
    
    _wrong_answer2= _singJ3;
    _wrong_answer3= _singJ4;
    
}
- (void)count{
    
    if(timercount<1){
        [timer invalidate];
        timer = nil;
        [self loadMusixOuss];
        
    }else{
        timercount=timercount-1;
    }
    
}
- (void)count3:(NSTimer *)timer3{
    
    timercount=timercount+1;
    if ((self.moviePlayerController.duration > 0.0) && (self.moviePlayerController.playableDuration > 0.0))
    {
        if (self.moviePlayerController.playableDuration == self.moviePlayerController.duration)
        {
            //LAUNCH
            [timer3 invalidate];
            timer3 = nil;
            NSLog(@"fffff");
        }
    }
}
-(void)launchCountdown{
    [self.playButton setHidden:false];
    NSLog(@"LAUNCH COUNT DOWN == !!!!!");
    _numberOfPulses=1;
    
    [timerdown invalidate];
    timerdown = nil;
    timerdown =[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
    timercountdown = 30;
    ccc = 0;
    [self countdown];
}
- (void)countdown{
    
    if(timercountdown<1){
        [timerdown invalidate];
        timerdown = nil;
        
    }else{
        ccc++;
        if (ccc % 2){
            timercountdown=timercountdown-1;
            [self.playButton sendActionsForControlEvents:UIControlEventTouchUpInside];
            [self.playButton configureToSelected:YES];
        }else if (ccc % 4){
            [self.playButton configureToSelected:NO];
        }
    }
    
}
- (IBAction)playButtonPressed:(id)sender
{
    // If we want to empty the button with every press
    [self.playButton configureButtonWithHightlightedShadowAndZoom:YES];
    
    
    _numberOfPulses++;
    [self.playButton setFillPercent:1-(_numberOfPulses*0.033333)];
    
    if(_numberOfPulses>30){
        _numberOfPulses=0;
        [self buttonIsEmpty:self.playButton];
    }
    
}
#pragma mark - ABFillButton Delegate
- (void)buttonIsEmpty:(ABFillButton *)button
{
    NSLog(@"buttonIsEmpty");
    [self.playButton setFillPercent:1.0];
    [self.playButton setHidden:true];
}
- (void)count2:(NSTimer *)timer2{
    
    if(timercount<1){
        [timer2 invalidate];
        timer2 = nil;
        [self.moviePlayerController stop];
        //        [_b1 sendActionsForControlEvents:UIControlEventTouchUpInside];
        
        if(_verif1==1){
            
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_winA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                // [_lifeO3 setImage: [UIImage imageNamed:@"dead.png"]];
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                //[_lifeO2 setImage: [UIImage imageNamed:@"dead.png"]];
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                [_lifeO1 setImage: [UIImage imageNamed:@"dead.png"]];
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
                
            }
            // CAS 2 ****** FALSE
        }else if(_verif1==2){
            
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_winB.png"] forState:UIControlStateNormal];
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
                
            }
            //CAS 3 ****** FALSE
        }else if(_verif1==3){
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
            }
            
            //CAS 4 ****** FALSE
        }else if(_verif1==4){
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
            }
        }
        
        
        
    }else{
        timercount=timercount-1;
    }
}

-(void)loadMusixOuss{
    [self connectedToInternet];
    if ([URLString2  isEqual: @"connected"]) {
        
        [self parsGetOuss];
        [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_normalA.png"] forState:UIControlStateNormal];
        [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_normalB.png"] forState:UIControlStateNormal];
        [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_normalC.png"] forState:UIControlStateNormal];
        [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_normalC.png"] forState:UIControlStateNormal];
        self.moviePlayerController.controlStyle = MPMovieControlStyleEmbedded;
        self.theMovieURL = [NSURL URLWithString:_song_url];
        
        self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL: self.theMovieURL];
        [self.moviePlayerController setControlStyle: MPMovieControlStyleNone];
        [self.view addSubview:self.moviePlayerController.view];
        self.moviePlayerController.movieSourceType = MPMovieSourceTypeStreaming;
        
        [self.moviePlayerController setFullscreen:NO];
        [self.moviePlayerController prepareToPlay];
        
        [self loadEverythingOuss];
        
        [timer invalidate];
        timer = nil;
        
        [timer2 invalidate];
        timer2 = nil;
        timerForPlay =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count3:) userInfo:nil repeats:YES];
        timercount = 0;
        
        [self count3:timerForPlay];
        
        [timerForPlay invalidate];
        timerForPlay = nil;
        
        timer2 =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count2:) userInfo:nil repeats:YES];
        timercount = 30;
        
        [self count2:timer2];
        NSLog(@"LAUNCH COUNT DOWN == !!!!!");
        [self launchCountdown];
    }else{
        
        UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SoneViewController *vc =[mainS instantiateViewControllerWithIdentifier:@"home"];
        [self.navigationController pushViewController: vc animated:NO];
    }
    
}


-(void)loadEverythingOuss {
    
    _verif1=1+arc4random_uniform(4);
    if(_verif1==1){
        
        [_b1 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_b2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_b3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_b4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
    }else if(_verif1==2){
        
        [_b1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_b2 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_b3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_b4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
    }else if(_verif1==3){
        
        
        [_b1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_b2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_b3 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_b4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        
    }else if(_verif1==4){
        
        
        [_b1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_b2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_b3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        [_b4 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        
    }
}

- (void)movieEventFullscreenHandler:(NSNotification*)notification {
    [self.moviePlayerController setFullscreen:NO animated:NO];
    [self.moviePlayerController setControlStyle:MPMovieControlStyleEmbedded];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (IBAction)favoris:(id)sender {
    
    NSString* reque;
    reque=@"select * from Favoris";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:reque]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    
    if ([mpo containsString:_ser]) {
        if ([mpo containsString:_der]) {
            [MozTopAlertView showWithType:MozAlertTypeError text:@"already added!" parentView:self.view];
        }
        else
        {
            reque=[NSString stringWithFormat:@"insert into Favoris ('Titre','Chanteur') values('%@','%@')",_ser,_der];
            [_DB executeQuery:reque];
            [MozTopAlertView showWithType:MozAlertTypeSuccess text:@"successfully added!" parentView:self.view];
        }
    }
    else
    {
        reque=[NSString stringWithFormat:@"insert into Favoris ('Titre','Chanteur') values('%@','%@')",_ser,_der];
        [_DB executeQuery:reque];
        [MozTopAlertView showWithType:MozAlertTypeSuccess text:@"successfully added!" parentView:self.view];
    }
    
    
}
// BOUTON 1 ********************
- (IBAction)b11:(id)sender {
    [self.playButton setHidden:true];
    
    [self.playButton setHidden:true];
    if ( ![timer isValid] &&  ![_b1.titleLabel.text  isEqual: @"GAME OVER"] &&  ![_b1.titleLabel.text  isEqual: @"GIVE UP"] &&  ![_b1.titleLabel.text  isEqual: @"LOSER"]){
        // CAS 1 ***** TRUE
        if(_verif1==1){
            
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_winA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            
            _score = _score +1;
            
            _ScoreAffich.text = [[NSNumber numberWithInt:_score] stringValue];
            [timer2 invalidate];
            timer2 = nil;
            
            timercount=0;
            [self.moviePlayerController stop];
            timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
            timercount = 2;
            [self count];
            // CAS 2 ****** FALSE
        }
        [timer2 invalidate];
        timer2 = nil;
        if(_verif1==2){
            
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_winB.png"] forState:UIControlStateNormal];
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
                
            }
            //CAS 3 ****** FALSE
        }else if(_verif1==3){
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _quitlbl.hidden = NO;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                //CAS 4 FALSE
            }else if(_verif1==4){
                
                [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
                [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
                [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
                [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
                // VIE RESTANT
                if (_lives3==3){
                    _lives3--;
                    _lifeO3.hidden = true;
                    
                    [self.moviePlayerController stop];
                    timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                    timercount = 2;
                    [self count];
                    
                }else if(_lives3==2){
                    _lives3--;
                    _lifeO2.hidden=true;
                    
                    [self.moviePlayerController stop];
                    timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                    timercount = 2;
                    [self count];
                }else if(_lives3==1){
                    _lives3--;
                    _lifeO1.hidden = true;
                    
                    [self.moviePlayerController stop];
                    
                    [self parseCompteScore];
                    _b1.hidden = true;
                    _b2.hidden = true;
                    _b3.hidden = true;
                    _b4.hidden = true;
                    _quitlbl.hidden = NO;
                    _btnRetry.hidden = false;
                    _itune.hidden =NO;
                    //CAS 4 FALSE
                }
            }
            //CAS 4 ****** FALSE
        }else if(_verif1==4){
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
            }
        }
    }else if ([_b1.titleLabel.text  isEqual: @"GAME OVER"] || [_b1.titleLabel.text  isEqual: @"GIVE UP"] || [_b1.titleLabel.text  isEqual: @"LOSER"] ){
        UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SoneViewController *vc =[mainS instantiateViewControllerWithIdentifier:@"getOut"];
        [self.navigationController pushViewController: vc animated:YES];
    }
    
}

// BOUTON 2 ********************
- (IBAction)b12:(id)sender {
    [self.playButton setHidden:true];
    if ( ![timer isValid]&&  ![_b1.titleLabel.text  isEqual: @"GAME OVER"] &&  ![_b1.titleLabel.text  isEqual: @"GIVE UP"] &&  ![_b1.titleLabel.text  isEqual: @"LOSER"]){
        // CAS 2 ******* TRUE
        if(_verif1==2){
            
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_winB.png"] forState:UIControlStateNormal];
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            
            _score = _score + 1;
            
            _ScoreAffich.text = [[NSNumber numberWithInt:_score] stringValue];
            
            [timer2 invalidate];
            timer2 = nil;
            [self.moviePlayerController stop];
            timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
            timercount = 2;
            [self count];
        }
        
        [timer2 invalidate];
        timer2 = nil;
        
        //CAS 1 ****** FAUX
        if(_verif1==1){
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_winA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
            }
            
            //CAS 3 ****** FALSE
        }else if(_verif1==3){
            
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _quitlbl.hidden = NO;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
            }
            //CAS 4 ****** FALSE
        }else if(_verif1==4){
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
            }
        }
    }else if ([_b1.titleLabel.text  isEqual: @"GAME OVER"] || [_b1.titleLabel.text  isEqual: @"GIVE UP"] || [_b1.titleLabel.text  isEqual: @"LOSER"] ){
        UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SoneViewController *vc =[mainS instantiateViewControllerWithIdentifier:@"getOut"];
        [self.navigationController pushViewController: vc animated:YES];
    }}




// BOUTON 3 ********************
- (IBAction)quitbt:(id)sender {
    [self InsertLocal];
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    NSString * stori ;
    
    
    switch (screenHeight) {
            
            // iPhone 4s
        case 480:
            stori=@"Main-4S";
            break;
            
      
            
            // iPhone 6
        case 667:
            stori=@"Main-6"  ;
            break;
            
            // iPhone 6 Plus
        case 736:
            stori=@"Main-6-Plus"  ;
            break;
            
            
        default:
            // it's an 5s
            stori=@"Main" ;
            break;
    }
    
    
    UIStoryboard *mainS =[UIStoryboard storyboardWithName:stori bundle:nil];
    
    StageViewController *vc =[mainS instantiateViewControllerWithIdentifier:@"homet"];
    [self.navigationController pushViewController: vc animated:NO];
    
}

- (IBAction)b13:(id)sender {
    [self.playButton setHidden:true];
    if ( ![timer isValid]&&  ![_b1.titleLabel.text  isEqual: @"GAME OVER"] &&  ![_b1.titleLabel.text  isEqual: @"GIVE UP"] &&  ![_b1.titleLabel.text  isEqual: @"LOSER"]){
        
        //CAS 3 ******* TRUE
        if(_verif1==3){
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            
            _score = _score + 1;
            _ScoreAffich.text = [[NSNumber numberWithInt:_score] stringValue];
            
            [timer2 invalidate];
            timer2 = nil;
            [self.moviePlayerController stop];
            timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
            timercount = 2;
            [self count];}
        
        [timer2 invalidate];
        timer2 = nil;
        // CAS 1 ******* FALSE
        if(_verif1==1){
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_winA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
            }
            //CAS 2 ***** FALSE
        }else if(_verif1==2){
            
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_winB.png"] forState:UIControlStateNormal];
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failC.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
            }
            
            //CAS 4 ****** FALSE
        }else if(_verif1==4){
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
            }
        }
        
    }else if ([_b1.titleLabel.text  isEqual: @"GAME OVER"] || [_b1.titleLabel.text  isEqual: @"GIVE UP"] || [_b1.titleLabel.text  isEqual: @"LOSER"] ){
        UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SoneViewController *vc =[mainS instantiateViewControllerWithIdentifier:@"getOut"];
        [self.navigationController pushViewController: vc animated:YES];
    }
}
// BOUTON 4
- (IBAction)b14:(id)sender {
    [self.playButton setHidden:true];
    if ( ![timer isValid]&&  ![_b1.titleLabel.text  isEqual: @"GAME OVER"] &&  ![_b1.titleLabel.text  isEqual: @"GIVE UP"] &&  ![_b1.titleLabel.text  isEqual: @"LOSER"]){
        
        //CAS 4 ******* TRUE
        if(_verif1==4){
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            
            _score = _score + 1;
            _ScoreAffich.text = [[NSNumber numberWithInt:_score] stringValue];
            
            [timer2 invalidate];
            timer2 = nil;
            [self.moviePlayerController stop];
            timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
            timercount = 2;
            [self count];}
        
        [timer2 invalidate];
        timer2 = nil;
        // CAS 1 ******* FALSE
        if(_verif1==1){
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
            }
            //CAS 2 ***** FALSE
        }else if(_verif1==2){
            
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
                _quitlbl.hidden = NO;
            }
            
            //CAS 3 ****** FALSE
        }else if(_verif1==3){
            
            [_b3 setBackgroundImage:[UIImage imageNamed:@"btn_winC.png"] forState:UIControlStateNormal];
            [_b2 setBackgroundImage:[UIImage imageNamed:@"btn_failB.png"] forState:UIControlStateNormal];
            [_b1 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            [_b4 setBackgroundImage:[UIImage imageNamed:@"btn_failA.png"] forState:UIControlStateNormal];
            // VIE RESTANT
            if (_lives3==3){
                _lives3--;
                _lifeO3.hidden = true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
                
            }else if(_lives3==2){
                _lives3--;
                _lifeO2.hidden=true;
                
                [self.moviePlayerController stop];
                timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
                timercount = 2;
                [self count];
            }else if(_lives3==1){
                _lives3--;
                _lifeO1.hidden = true;
                _b1.hidden = true;
                _b2.hidden = true;
                _b3.hidden = true;
                _b4.hidden = true;
                [self.moviePlayerController stop];
                
                [self parseCompteScore];
                _quitlbl.hidden = NO;
                _btnRetry.hidden = false;
                _itune.hidden =NO;
            }
        }
        
    }else if ([_b1.titleLabel.text  isEqual: @"GAME OVER"] || [_b1.titleLabel.text  isEqual: @"GIVE UP"] || [_b1.titleLabel.text  isEqual: @"LOSER"] ){
        UIStoryboard *mainS =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SoneViewController *vc =[mainS instantiateViewControllerWithIdentifier:@"getOut"];
        [self.navigationController pushViewController: vc animated:YES];
    }
}

- (IBAction)testCont:(id)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self InsertLocal];
    EndViewController * v=[segue destinationViewController];
    
    v.linkArray = self.linkArray;
    v.SingerArray = self.SingerArray;
}



-(void)InsertLocal{
    
    int a = 0;
    if([_genre  isEqual: @"21"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Music ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",a,a,a,a,self.score,a];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    else if([_genre  isEqual: @"6"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Music ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",a,self.score,a,a,a,a];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    else if([_genre  isEqual: @"15"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Music ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",a,a,a,self.score,a,a];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    
    else if([_genre  isEqual: @"11"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Music ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",self.score,a,a,a,a,a];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    else if([_genre  isEqual: @"24"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Music ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",a,a,self.score,a,a,a];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
        
        
        
    }
    else if([_genre  isEqual: @"14"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Music ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",a,a,a,a,a,self.score];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    
    
}





- (IBAction)btnRet:(id)sender {
    [self InsertLocal];
    _lives3 = 3;
    _lifeO1.hidden = false;
    _lifeO2.hidden = false;
    _score = 0;
    _quitlbl.hidden = true;
    _b1.hidden = false;
    _b2.hidden = false;
    _b3.hidden = false;
    _b4.hidden = false;
    _ScoreAffich.text = @"0";
    _lifeO3.hidden = false;
    _btnRetry.hidden = true;
    _itune.hidden =YES;
    [timer invalidate];
    timer = nil;
    [timer2 invalidate];
    timer2 = nil;
    [self loadMusixOuss];
}
@end
