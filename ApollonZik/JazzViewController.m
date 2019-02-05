//
//  JazzViewController.m
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 06/12/15.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import "JazzViewController.h"
#import "MozTopAlertView.h"


@interface JazzViewController ()
{
    
}
@end

@implementation JazzViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.SingerArray = [[NSMutableArray alloc] init];
     self.linkArray = [[NSMutableArray alloc] init];
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"Appollon"];
    
    [self lili];
    _verif1=0;
    _but=0;
    self.life=3;
    self.FinaleScore.hidden =YES;
    self.quit.hidden=YES;
    self.retry.hidden=YES;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) counter{
    
   
    
    
    if ([_CountDown.text isEqualToString:@"0"]) {
        timerExample6 = [[MZTimerLabel alloc] initWithLabel:_CountDown andTimerType:MZTimerLabelTypeTimer];
        [timerExample6 setCountDownTime:30];
        timerExample6.resetTimerAfterFinish = YES;
        //timerExample6.delegate = self;
        if(![timerExample6 counting]){
            
            [timerExample6 start];
            
            
        }
    }
    else
    {
        
        [timerExample6 setCountDownTime:0];
        _CountDown.text = 0;
        [timerExample6 setCountDownTime:0];
        timerExample6 = [[MZTimerLabel alloc] initWithLabel:_CountDown andTimerType:MZTimerLabelTypeTimer];
        [timerExample6 setCountDownTime:30];
        timerExample6.resetTimerAfterFinish = YES;
        
        if(![timerExample6 counting]){
            
            [timerExample6 start];
            
            
        }
    }
    
    
}




- (void)timerLabel:(MZTimerLabel*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
    
    [self lili];
    
}





-(void)lili{
    _link = nil;
    
    _load.hidden =NO;
    [_load startAnimating];
    
    float rndValue = arc4random_uniform(30);
    float fake1 =arc4random_uniform(30);
    
    float fake2 = arc4random_uniform(30);
    
    float fake3 = arc4random_uniform(30);
    
    
    
    _test = [[NSNumber numberWithFloat:rndValue]intValue];
    _f1 = [[NSNumber numberWithFloat:fake1]intValue];
    _f2 = [[NSNumber numberWithFloat:fake2]intValue];
    _f3 = [[NSNumber numberWithFloat:fake3]intValue];
    @try {
        if([_genre  isEqual: @"21"])
        {
            NSError *error = nil;
            NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL   URLWithString:@"https://itunes.apple.com/fr/rss/topsongs/limit=30/genre=21/json"]];
            id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
            _myarray =[[jsonObjects objectForKey:@"feed"]objectForKey:@"entry"];
        }
        else if([_genre  isEqual: @"6"])
        {
            NSError *error = nil;
            NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL   URLWithString:@"https://itunes.apple.com/fr/rss/topsongs/limit=30/genre=6/json"]];
            id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
            _myarray =[[jsonObjects objectForKey:@"feed"]objectForKey:@"entry"];
        }
        else if([_genre  isEqual: @"15"])
        {
            NSError *error = nil;
            NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL   URLWithString:@"https://itunes.apple.com/fr/rss/topsongs/limit=30/genre=15/json"]];
            id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
            _myarray =[[jsonObjects objectForKey:@"feed"]objectForKey:@"entry"];
        }
        
        else if([_genre  isEqual: @"11"])
        {
            NSError *error = nil;
            NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL   URLWithString:@"https://itunes.apple.com/fr/rss/topsongs/limit=30/genre=11/json"]];
            id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
            _myarray =[[jsonObjects objectForKey:@"feed"]objectForKey:@"entry"];
        }
        else if([_genre  isEqual: @"24"])
        {
            NSError *error = nil;
            NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL   URLWithString:@"https://itunes.apple.com/fr/rss/topsongs/limit=30/genre=24/json"]];
            id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
            _myarray =[[jsonObjects objectForKey:@"feed"]objectForKey:@"entry"];
        }
        else if([_genre  isEqual: @"14"])
        {
            NSError *error = nil;
            NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL   URLWithString:@"https://itunes.apple.com/fr/rss/topsongs/limit=30/genre=24/json"]];
            id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
            _myarray =[[jsonObjects objectForKey:@"feed"]objectForKey:@"entry"];
        }
     
       
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        _load.hidden =NO;
        [_load startAnimating];
        
        [self lili];
        [_load stopAnimating];
        
    }
    
    
    
    
    
    
    
    _sing =[[[_myarray objectAtIndex:_test]objectForKey:@"im:name"]objectForKey:@"label"];
    
    _ser=_sing;
    _sing = [_sing stringByReplacingOccurrencesOfString:@" "withString:@"%20"];
    
    
    
    
    
    _titl =[[[_myarray objectAtIndex:_test]objectForKey:@"im:artist"]objectForKey:@"label"];
    
    _der = _titl;
    _titl = [_titl stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    
    
    
    //NSString * kl =[[[_myarray objectAtIndex:_test]objectForKey:@"im:artist"]objectForKey:@"label"];
    
    _right_answer = _ser;
    NSLog(@"%@",_right_answer);
    
    
    [self.SingerArray addObject:[NSString stringWithFormat:@"%@ %@",_ser,_der]];
    
     NSLog(@"from jazz2 %@", self.SingerArray);
    
  
    
    
    
    _link = [[[[[_myarray objectAtIndex:_f1]objectForKey:@"im:collection"]objectForKey:@"link"]objectForKey:@"attributes"]objectForKey:@"href"];
    
    
   
    [self.linkArray addObject:[NSString stringWithFormat:@"%@",_link]];
    
    NSLog(@"from jazz2 %@", self.linkArray);
    NSLog(@"from but %d", self.but);
    
    NSString * sin =[[[_myarray objectAtIndex:_f1]objectForKey:@"im:name"]objectForKey:@"label"];
    _wrong_answer = [NSString stringWithFormat:@"%@ ",sin];
    
    NSString * nOP =[[[_myarray objectAtIndex:_f2]objectForKey:@"im:name"]objectForKey:@"label"];
    _wrong_answer2 = [NSString stringWithFormat:@"%@ ", nOP];
    
    NSString * kolo =[[[_myarray objectAtIndex:_f3]objectForKey:@"im:name"]objectForKey:@"label"];
    _wrong_answer3 = [NSString stringWithFormat:@"%@", kolo];
    
    @try {
        NSError *erreur = nil;
        NSData *jsonQuiz = [NSData dataWithContentsOfURL:[NSURL   URLWithString:[NSString stringWithFormat:@"http://api.musixmatch.com/ws/1.1/matcher.lyrics.get?q_track=%@&q_artist=%@&apikey=8f2e310895f531ea1062f67cbdd64905",_sing,_titl]]];
        
        
        id quizObject = [NSJSONSerialization JSONObjectWithData:jsonQuiz options:NSJSONReadingMutableContainers error:&erreur];
        
        _li =[[[[quizObject objectForKey:@"message"]objectForKey:@"body"]objectForKey:@"lyrics"]objectForKey:@"lyrics_body"];
        
        if([_li  isEqual: @"INSTRUMENTAL"])
        {
            _load.hidden =NO;
            [_load startAnimating];
            [self lili];
            [_load stopAnimating];
        }
        else if([_li  isEqual: @""])
        {
            _load.hidden =NO;
            [_load startAnimating];
            [self lili];
            [_load stopAnimating];
        }
        else if([_li  isEqual: @" "])
        {
            _load.hidden =NO;
            [_load startAnimating];
            [self lili];
            [_load stopAnimating];
        }
        else{
            _LyricShow.text = _li;
            [self randButton];
            [self counter];
        }
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        
        _load.hidden =NO;
        [_load startAnimating];
        [self lili];
        [_load stopAnimating];
        
    }
    
    
    
}







-(void)randButton {
    
    _verif1=1+arc4random_uniform(3);
    if(_verif1==1){
        [_Proposition1 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_Proposition2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_Proposition3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_Proposition4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
    }else if(_verif1==2){
        [_Proposition1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        [_Proposition2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_Proposition3 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_Proposition4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
    }else if(_verif1==3){
        
        [_Proposition1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        [_Proposition2 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        [_Proposition3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_Proposition4 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        
    }else if(_verif1==4){
        
        [_Proposition1 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer] forState:UIControlStateNormal];
        [_Proposition2 setTitle:[NSString stringWithFormat:@"%@",_right_answer] forState:UIControlStateNormal];
        [_Proposition3 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer3] forState:UIControlStateNormal];
        [_Proposition4 setTitle:[NSString stringWithFormat:@"%@",_wrong_answer2] forState:UIControlStateNormal];
        
    }
    
    
    _load.hidden =YES;
    [_load stopAnimating];
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)prop1:(id)sender {
    if ([_Proposition1.titleLabel.text  isEqual: _right_answer]) {
        
        self.but += 1;
        [self.Score setText:[NSString stringWithFormat:@"%d", self.but]];
        _load.hidden =NO;
        [_load startAnimating];
        [self lili];
        [_load stopAnimating];
    }
    else{
        if (self.life>0) {
            if (self.life==3) {
                self.life-=1;
                self.life1.hidden=YES;
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }else if (self.life==2) {
                self.life-=1;
                self.life2.hidden=YES;
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }else if (self.life==1) {
                self.life-=1;
                self.life3.hidden=YES;
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }
            
        }else{
            [timerExample6 setCountDownTime:0];
            self.FinaleScore.hidden =NO;
            
            self.FinaleScore.text= [NSString stringWithFormat:@"Finale score : %d",self.but ];
            self.quit.hidden=NO;
            self.retry.hidden=NO;
             self.mytab.hidden =NO;
            self.LyricShow.hidden=YES;
            self.favZap.hidden = YES;
            self.pauseZap.hidden = YES;
            self.Score.hidden = YES;
             self.CountDown.hidden = YES;
            
            self.buy.hidden = NO;
            self.Proposition1.hidden = YES;
            self.Proposition2.hidden = YES;
            self.Proposition3.hidden = YES;
            self.Proposition4.hidden = YES;
            
            self.green.hidden = YES;
            self.red.hidden = YES;
            
        
            
        }
    }
}

- (IBAction)prop2:(id)sender {
    if ([_Proposition2.titleLabel.text  isEqual: _right_answer]) {
        self.but += 1;
        [self.Score setText:[NSString stringWithFormat:@"%d", self.but]];
        [timerExample6 setCountDownTime:0];
        _CountDown.text = 0;
        [timerExample6 setCountDownTime:0];
        _load.hidden =NO;
        [_load startAnimating];
        [self lili];
        [_load stopAnimating];
    }
    else{
        if (self.life>0) {
            if (self.life==3) {
                self.life-=1;
                self.life1.hidden=YES;
                [timerExample6 setCountDownTime:0];
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }else if (self.life==2) {
                self.life-=1;
                self.life2.hidden=YES;
                [timerExample6 setCountDownTime:0];
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }else if (self.life==1) {
                self.life-=1;
                self.life3.hidden=YES;
                [timerExample6 setCountDownTime:0];
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }
            
        }else{
            [timerExample6 setCountDownTime:0];
            self.FinaleScore.hidden =NO;
            
            self.FinaleScore.text= [NSString stringWithFormat:@"Finale score : %d",self.but ];
            self.quit.hidden=NO;
            self.retry.hidden=NO;
             self.mytab.hidden =NO;
            self.LyricShow.hidden=YES;
            self.favZap.hidden = YES;
            self.pauseZap.hidden = YES;
            self.Score.hidden = YES;
            self.CountDown.hidden = YES;
self.buy.hidden = NO;
            self.Proposition1.hidden = YES;
            self.Proposition2.hidden = YES;
            self.Proposition3.hidden = YES;
            self.Proposition4.hidden = YES;
            
            self.green.hidden = YES;
            self.red.hidden = YES;
            
        }
    }
}

- (IBAction)prop3:(id)sender {
    if ([_Proposition3.titleLabel.text  isEqual: _right_answer]) {
        self.but += 1;
        [self.Score setText:[NSString stringWithFormat:@"%d", self.but]];
        [timerExample6 setCountDownTime:0];
        _CountDown.text = 0;
        [timerExample6 setCountDownTime:0];
        _load.hidden =NO;
        [_load startAnimating];
        [self lili];
        [_load stopAnimating];
    }
    else{
        if (self.life>0) {
            if (self.life==3) {
                self.life-=1;
                self.life1.hidden=YES;
                [timerExample6 setCountDownTime:0];
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }else if (self.life==2) {
                self.life-=1;
                self.life2.hidden=YES;
                [timerExample6 setCountDownTime:0];
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }else if (self.life==1) {
                self.life-=1;
                self.life3.hidden=YES;
                [timerExample6 setCountDownTime:0];
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }
            
        }else{
            [timerExample6 setCountDownTime:0];
            self.FinaleScore.hidden =NO;
            
            self.FinaleScore.text= [NSString stringWithFormat:@"Finale score : %d",self.but ];
            self.quit.hidden=NO;
            self.retry.hidden=NO;
             self.mytab.hidden =NO;
            self.LyricShow.hidden=YES;
            self.favZap.hidden = YES;
            self.pauseZap.hidden = YES;
            self.Score.hidden = YES;
            self.CountDown.hidden = YES;
self.buy.hidden = NO;
            self.Proposition1.hidden = YES;
            self.Proposition2.hidden = YES;
            self.Proposition3.hidden = YES;
            self.Proposition4.hidden = YES;
            
            
            self.green.hidden = YES;
            self.red.hidden = YES;
            
        }
    }
}

- (IBAction)prop4:(id)sender {
    if ([_Proposition4.titleLabel.text  isEqual: _right_answer]) {
        self.but += 1;
        [self.Score setText:[NSString stringWithFormat:@"%d", self.but]];
        [timerExample6 setCountDownTime:0];
        _CountDown.text = 0;
        [timerExample6 setCountDownTime:0];
        _load.hidden =NO;
        [_load startAnimating];
        [self lili];
        [_load stopAnimating];
    }
    else{
        if (self.life>0) {
            if (self.life==3) {
                self.life-=1;
                self.life1.hidden=YES;
                [timerExample6 setCountDownTime:0];
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }else if (self.life==2) {
                self.life-=1;
                self.life2.hidden=YES;
                [timerExample6 setCountDownTime:0];
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }else if (self.life==1) {
                self.life-=1;
                self.life3.hidden=YES;
                [timerExample6 setCountDownTime:0];
                _load.hidden =NO;
                [_load startAnimating];
                [self lili];
                [_load stopAnimating];
            }
            
        }else{
            
            [timerExample6 setCountDownTime:0];
            self.FinaleScore.hidden =NO;
            
            self.FinaleScore.text= [NSString stringWithFormat:@"Finale score : %d",self.but ];
            self.quit.hidden=NO;
            self.retry.hidden=NO;
            self.mytab.hidden =NO;
            self.LyricShow.hidden=YES;
            self.favZap.hidden = YES;
            self.pauseZap.hidden = YES;
            self.Score.hidden = YES;
            self.CountDown.hidden = YES;
self.buy.hidden = NO;
            self.Proposition1.hidden = YES;
            self.Proposition2.hidden = YES;
            self.Proposition3.hidden = YES;
            self.Proposition4.hidden = YES;
            
            self.green.hidden = YES;
            self.red.hidden = YES;
            
            
          
            
            
            
        }
    }
}

- (IBAction)pause:(id)sender {
    
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Menu Pause"
                                  message:@"Do you want to leave?"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Yes"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
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

                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"No"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
    
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

///////
/*
 Code pour inserer dans la base sql
 
 */

/////

- (IBAction)Quitter:(id)sender {
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
- (IBAction)Nouveau:(id)sender {
    [self InsertLocal];
     self.green.hidden = NO;
     self.red.hidden = NO;
    self.favZap.hidden = NO;
    self.pauseZap.hidden = NO;
    self.Score.hidden = NO;
    self.CountDown.hidden = NO;
    self.life1.hidden=NO;
    self.life2.hidden=NO;
    self.buy.hidden = YES;
    self.life3.hidden=NO;
    self.FinaleScore.hidden =YES;
    self.quit.hidden=YES;
    self.retry.hidden=YES;
    self.LyricShow.hidden=NO;
    self.Proposition1.hidden = NO;
    self.Proposition2.hidden = NO;
    self.Proposition3.hidden = NO;
    self.Proposition4.hidden = NO;
    self.life=3;
    self.but = 0;
    
    [self.Score setText:[NSString stringWithFormat:@"%d", self.but]];
    
    [self counter];
    
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
        NSString* requete=[NSString stringWithFormat:@"insert into Lyric ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",a,a,a,a,self.but,a];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    else if([_genre  isEqual: @"6"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Lyric ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",a,self.but,a,a,a,a];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    else if([_genre  isEqual: @"15"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Lyric ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",a,a,a,self.but,a,a];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    
    else if([_genre  isEqual: @"11"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Lyric ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",self.but,a,a,a,a,a];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    else if([_genre  isEqual: @"24"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Lyric ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",a,a,self.but,a,a,a];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    else if([_genre  isEqual: @"14"])
    {
        NSString* requete=[NSString stringWithFormat:@"insert into Lyric ('jazz','country','reggae','rnb','rock','pop') values('%d','%d','%d','%d','%d','%d')",a,a,a,a,a,self.but];
        [_DB executeQuery:requete];
        NSLog(@"saved!");
    }
    
   
}

 



@end
