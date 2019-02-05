//
//  DuelViewController.m
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 22/01/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import "DuelViewController.h"

@interface DuelViewController ()
@end
@implementation DuelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _score_P2.transform = CGAffineTransformMakeRotation(M_PI);
    _rp1.transform = CGAffineTransformMakeRotation(M_PI);
    _rp2.transform = CGAffineTransformMakeRotation(M_PI);
    _rp3.transform = CGAffineTransformMakeRotation(M_PI);
    _rp4.transform = CGAffineTransformMakeRotation(M_PI);
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieEventFullscreenHandler:)
                                                 name:MPMoviePlayerWillEnterFullscreenNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieEventFullscreenHandler:)
                                                 name:MPMoviePlayerDidEnterFullscreenNotification
                                               object:nil];
    // Do any additional setup after loading the view.
    [self GETSON];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)GETSON{
    [self.moviePlayerController stop];
    _lp1.enabled = NO;
    _lp2.enabled = NO;
    _lp3.enabled = NO;
    _lp4.enabled = NO;
    
    _rp1.enabled = NO;
    _rp2.enabled = NO;
    _rp3.enabled = NO;
    _rp4.enabled = NO;
    //BLOCK PARSING
    
    //BLOCK GET DATA FROM iTunes
    NSError *error = nil;
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL   URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/fr/rss/topsongs/limit=160/genre=21/json"]]];
    
  
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    _myarrayJ =[[jsonObjects objectForKey:@"feed"]objectForKey:@"entry"];
    
    //END BLOCK GET DATA FROM iTunes
    //BLOCK GET RANDOM SONG number
    
    //RIGHT ONE
    float rndValue = 1+arc4random_uniform(100) ;
    _testJ = [[NSNumber numberWithFloat:rndValue]intValue];
    //WRONG ONES
    float fake1 = 1+arc4random_uniform(100) ;
    while (fake1==rndValue) {
        fake1 = 1+arc4random_uniform(100) ;
    }
    
    float fake2 = 1+arc4random_uniform(100) ;
    while (fake2==rndValue || fake2==fake1) {
        fake2 = 1+arc4random_uniform(100) ;
    }
    float fake3 = 1+arc4random_uniform(100) ;
    while (fake3==rndValue || fake3==fake1 || fake3 == fake2) {
        fake3 = 1+arc4random_uniform(100) ;
    }
    
    NSArray * kola = [[_myarrayJ objectAtIndex:_testJ]objectForKey:@"link"];
    NSString * kas = [[[kola objectAtIndex:1]objectForKey:@"attributes"]objectForKey:@"href"];
    
    
    
    _song_url=kas;   
    _singJ =[[[_myarrayJ objectAtIndex:_testJ]objectForKey:@"title"]objectForKey:@"label"];
    //WRONG ONES
    _singJ2 =[[[_myarrayJ objectAtIndex:fake1]objectForKey:@"title"]objectForKey:@"label"];
    _singJ3 =[[[_myarrayJ objectAtIndex:fake2]objectForKey:@"title"]objectForKey:@"label"];
    _singJ4 =[[[_myarrayJ objectAtIndex:fake3]objectForKey:@"title"]objectForKey:@"label"];
    //END BLOCK PARSING
    _right_answer= _singJ;
    
    _wrong_answer= _singJ2;
    
    _wrong_answer2= _singJ3;
    _wrong_answer3= _singJ4;
   
    [self loadMusic];
    
}


-(void)loadMusic{
    
    
    
        self.moviePlayerController.controlStyle = MPMovieControlStyleEmbedded;
        self.theMovieURL = [NSURL URLWithString:_song_url];
        
        self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL: self.theMovieURL];
        [self.moviePlayerController setControlStyle: MPMovieControlStyleNone];
        [self.view addSubview:self.moviePlayerController.view];
        self.moviePlayerController.movieSourceType = MPMovieSourceTypeStreaming;
        
        [self.moviePlayerController setFullscreen:NO];
        [self.moviePlayerController prepareToPlay];
    
   
    [self.moviePlayerController play];
            
            _lp1.enabled = YES;
            _lp2.enabled = YES;
            _lp3.enabled = YES;
            _lp4.enabled = YES;
            
            _rp1.enabled = YES;
            _rp2.enabled = YES;
            _rp3.enabled = YES;
            _rp4.enabled = YES;
    if ((self.moviePlayerController.duration > 0.0) && (self.moviePlayerController.playableDuration > 0.0))
    {
        if (self.moviePlayerController.playableDuration == self.moviePlayerController.duration)
        {
             [self GETSON];
            
        }
    }
            [self loadAllButtons];
    
   
    
}

-(void)loadAllButtons {
    
    _verif1=1+arc4random_uniform(4);
    if(_verif1==1){
        
        [_lp1 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_lp2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_lp3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_lp4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        
        [_rp1 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_rp2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_rp3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_rp4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        
        
        
    }else if(_verif1==2){
        
        [_lp1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_lp2 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_lp3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_lp4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        
        [_rp1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_rp2 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_rp3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_rp4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
    }else if(_verif1==3){
        
        
        [_lp1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_lp2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_lp3 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_lp4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        
        [_rp1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_rp2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_rp3 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_rp4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        
    }else if(_verif1==4){
        
        
        [_lp1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        [_lp2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_lp3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_lp4 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        
        [_rp1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        [_rp2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_rp3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_rp4 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        
    }
    
   
}

- (void)movieEventFullscreenHandler:(NSNotification*)notification {
    [self.moviePlayerController setFullscreen:NO animated:NO];
    [self.moviePlayerController setControlStyle:MPMovieControlStyleEmbedded];
}














- (IBAction)quit:(id)sender {
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

- (IBAction)retry:(id)sender {
    self.score1 =0;
    self.score2=0;
    _score_P2.text = @"0";
    _score_P1.text = @"0";
        _lp1.hidden = NO;
        _lp2.hidden = NO;
        _lp3.hidden = NO;
        _lp4.hidden = NO;
        
        _rp1.hidden = NO;
        _rp2.hidden = NO;
        _rp3.hidden = NO;
        _rp4.hidden = NO;
        
        _score_P1.hidden = NO;
        _score_P2.hidden = NO;
        
        _yellow.hidden = YES;
        _blue.hidden = YES;
        
        _trylbl.hidden = YES;
        _quitlbl.hidden = YES;
    
}

- (IBAction)prop1_P1:(id)sender {
    [self.moviePlayerController stop];
    if ((self.score1 < 10)&& (self.score2 < 10)){
        
    if ([_lp1.titleLabel.text  isEqual: _right_answer]) {
       
       
            self.score1 += 1;
            [self.score_P1 setText:[NSString stringWithFormat:@"%d", self.score1]];
        
             [self GETSON];
        }
    else {
            self.score2 += 1;
            [self.score_P2 setText:[NSString stringWithFormat:@"%d", self.score2]];
            
            [self GETSON];
        }
    }
   else
        {
            _yellow.text = [NSString stringWithFormat:@"Yellow player : %d",self.score2];
            _blue.text =[NSString stringWithFormat:@"Blue player : %d",self.score1];

            
            _lp1.hidden = YES;
            _lp2.hidden = YES;
            _lp3.hidden = YES;
            _lp4.hidden = YES;
            
            _rp1.hidden = YES;
            _rp2.hidden = YES;
            _rp3.hidden = YES;
            _rp4.hidden = YES;
            
            _score_P1.hidden = YES;
            _score_P2.hidden = YES;
            
            _yellow.hidden = NO;
            _blue.hidden = NO;
            
            _trylbl.hidden = NO;
            _quitlbl.hidden = NO;
        }
    
}

- (IBAction)prop2_P1:(id)sender {
    [self.moviePlayerController stop];
    if ((self.score1 < 10)&& (self.score2 < 10)){
        
        if ([_lp2.titleLabel.text  isEqual: _right_answer]) {
            
            
            self.score1 += 1;
            [self.score_P1 setText:[NSString stringWithFormat:@"%d", self.score1]];
            [self GETSON];
        }
        else {
            self.score2 += 1;
            [self.score_P2 setText:[NSString stringWithFormat:@"%d", self.score2]];
            
            [self GETSON];
        }
    }
    else
    {
        _yellow.text = [NSString stringWithFormat:@"Yellow player : %d",self.score2];
        _blue.text =[NSString stringWithFormat:@"Blue player : %d",self.score1];
        
        
        _lp1.hidden = YES;
        _lp2.hidden = YES;
        _lp3.hidden = YES;
        _lp4.hidden = YES;
        
        _rp1.hidden = YES;
        _rp2.hidden = YES;
        _rp3.hidden = YES;
        _rp4.hidden = YES;
        
        _score_P1.hidden = YES;
        _score_P2.hidden = YES;
        
        _yellow.hidden = NO;
        _blue.hidden = NO;
        
        _trylbl.hidden = NO;
        _quitlbl.hidden = NO;
    }
    
}

- (IBAction)prop3_P1:(id)sender {
    [self.moviePlayerController stop];
    if ((self.score1 < 10)&& (self.score2 < 10)){
        
        if ([_lp3.titleLabel.text  isEqual: _right_answer]) {
            
            
            self.score1 += 1;
            [self.score_P1 setText:[NSString stringWithFormat:@"%d", self.score1]];
            [self GETSON];
        }
        else {
            self.score2 += 1;
            [self.score_P2 setText:[NSString stringWithFormat:@"%d", self.score2]];
            
            [self GETSON];
        }
    }
    else
    {
        _yellow.text = [NSString stringWithFormat:@"Yellow player : %d",self.score2];
        _blue.text =[NSString stringWithFormat:@"Blue player : %d",self.score1];
        
        
        _lp1.hidden = YES;
        _lp2.hidden = YES;
        _lp3.hidden = YES;
        _lp4.hidden = YES;
        
        _rp1.hidden = YES;
        _rp2.hidden = YES;
        _rp3.hidden = YES;
        _rp4.hidden = YES;
        
        _score_P1.hidden = YES;
        _score_P2.hidden = YES;
        
        _yellow.hidden = NO;
        _blue.hidden = NO;
        
        _trylbl.hidden = NO;
        _quitlbl.hidden = NO;
    }
    
}

- (IBAction)prop4_P1:(id)sender {
    [self.moviePlayerController stop];
    if ((self.score1 < 10)&& (self.score2 < 10)){
        
        if ([_lp4.titleLabel.text  isEqual: _right_answer]) {
            
            
            self.score1 += 1;
            [self.score_P1 setText:[NSString stringWithFormat:@"%d", self.score1]];
            [self GETSON];
        }
        else {
            self.score2 += 1;
            [self.score_P2 setText:[NSString stringWithFormat:@"%d", self.score2]];
            
            [self GETSON];
        }
    }
    else
    {
        _yellow.text = [NSString stringWithFormat:@"Yellow player : %d",self.score2];
        _blue.text =[NSString stringWithFormat:@"Blue player : %d",self.score1];
        
        
        _lp1.hidden = YES;
        _lp2.hidden = YES;
        _lp3.hidden = YES;
        _lp4.hidden = YES;
        
        _rp1.hidden = YES;
        _rp2.hidden = YES;
        _rp3.hidden = YES;
        _rp4.hidden = YES;
        
        _score_P1.hidden = YES;
        _score_P2.hidden = YES;
        
        _yellow.hidden = NO;
        _blue.hidden = NO;
        
        _trylbl.hidden = NO;
        _quitlbl.hidden = NO;
    }
    
}




- (IBAction)prop1_P2:(id)sender {
     [self.moviePlayerController stop];
    if ((self.score1 < 10)&& (self.score2 < 10)){
        
        if ([_rp1.titleLabel.text  isEqual: _right_answer]) {
            
            
            self.score1 += 1;
            [self.score_P1 setText:[NSString stringWithFormat:@"%d", self.score1]];
            [self GETSON];
        }
        else {
            self.score2 += 1;
            [self.score_P2 setText:[NSString stringWithFormat:@"%d", self.score2]];
            
            [self GETSON];
        }
    }
    else
    {
        _yellow.text = [NSString stringWithFormat:@"Yellow player : %d",self.score2];
        _blue.text =[NSString stringWithFormat:@"Blue player : %d",self.score1];
        
        
        _lp1.hidden = YES;
        _lp2.hidden = YES;
        _lp3.hidden = YES;
        _lp4.hidden = YES;
        
        _rp1.hidden = YES;
        _rp2.hidden = YES;
        _rp3.hidden = YES;
        _rp4.hidden = YES;
        
        _score_P1.hidden = YES;
        _score_P2.hidden = YES;
        
        _yellow.hidden = NO;
        _blue.hidden = NO;
        
        _trylbl.hidden = NO;
        _quitlbl.hidden = NO;
    }
    
}

- (IBAction)prop2_P2:(id)sender {
    [self.moviePlayerController stop];
    if ((self.score1 < 10)&& (self.score2 < 10)){
        
        if ([_rp2.titleLabel.text  isEqual: _right_answer]) {
            
            
            self.score1 += 1;
            [self.score_P1 setText:[NSString stringWithFormat:@"%d", self.score1]];
            [self GETSON];
        }
        else {
            self.score2 += 1;
            [self.score_P2 setText:[NSString stringWithFormat:@"%d", self.score2]];
            
            [self GETSON];
        }
    }
    else
    {
        _yellow.text = [NSString stringWithFormat:@"Yellow player : %d",self.score2];
        _blue.text =[NSString stringWithFormat:@"Blue player : %d",self.score1];
        
        
        _lp1.hidden = YES;
        _lp2.hidden = YES;
        _lp3.hidden = YES;
        _lp4.hidden = YES;
        
        _rp1.hidden = YES;
        _rp2.hidden = YES;
        _rp3.hidden = YES;
        _rp4.hidden = YES;
        
        _score_P1.hidden = YES;
        _score_P2.hidden = YES;
        
        _yellow.hidden = NO;
        _blue.hidden = NO;
        
        _trylbl.hidden = NO;
        _quitlbl.hidden = NO;
    }
    
}

- (IBAction)prop3_P2:(id)sender {
    [self.moviePlayerController stop];
    if ((self.score1 < 10)&& (self.score2 < 10)){
        
        if ([_rp3.titleLabel.text  isEqual: _right_answer]) {
            
            
            self.score1 += 1;
            [self.score_P1 setText:[NSString stringWithFormat:@"%d", self.score1]];
            [self GETSON];
        }
        else {
            self.score2 += 1;
            [self.score_P2 setText:[NSString stringWithFormat:@"%d", self.score2]];
            
            [self GETSON];
        }
    }
    else
    {
        _yellow.text = [NSString stringWithFormat:@"Yellow player : %d",self.score2];
        _blue.text =[NSString stringWithFormat:@"Blue player : %d",self.score1];
        
        
        _lp1.hidden = YES;
        _lp2.hidden = YES;
        _lp3.hidden = YES;
        _lp4.hidden = YES;
        
        _rp1.hidden = YES;
        _rp2.hidden = YES;
        _rp3.hidden = YES;
        _rp4.hidden = YES;
        
        _score_P1.hidden = YES;
        _score_P2.hidden = YES;
        
        _yellow.hidden = NO;
        _blue.hidden = NO;
        
        _trylbl.hidden = NO;
        _quitlbl.hidden = NO;
    }
    
}

- (IBAction)prop4_P2:(id)sender {
    [self.moviePlayerController stop];
    if ((self.score1 < 10)&& (self.score2 < 10)){
        
        if ([_rp4.titleLabel.text  isEqual: _right_answer]) {
            
            
            self.score1 += 1;
            [self.score_P1 setText:[NSString stringWithFormat:@"%d", self.score1]];
            [self GETSON];
        }
        else {
            self.score2 += 1;
            [self.score_P2 setText:[NSString stringWithFormat:@"%d", self.score2]];
            
            [self GETSON];
        }
    }
    else
    {
        _yellow.text = [NSString stringWithFormat:@"Yellow player : %d",self.score2];
        _blue.text =[NSString stringWithFormat:@"Blue player : %d",self.score1];
        
        
        _lp1.hidden = YES;
        _lp2.hidden = YES;
        _lp3.hidden = YES;
        _lp4.hidden = YES;
        
        _rp1.hidden = YES;
        _rp2.hidden = YES;
        _rp3.hidden = YES;
        _rp4.hidden = YES;
        
        _score_P1.hidden = YES;
        _score_P2.hidden = YES;
        
        _yellow.hidden = NO;
        _blue.hidden = NO;
        
        _trylbl.hidden = NO;
        _quitlbl.hidden = NO;
    }
    
}


@end
