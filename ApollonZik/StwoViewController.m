//
//  StwoViewController.m
//  ApollonZik
//
//  Created by Gothi on 02/12/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import "StwoViewController.h"

@interface StwoViewController ()

@end
int timercount13;
@implementation StwoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"Appollon"];
    timer23 =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count12) userInfo:nil repeats:YES];
    timercount13 = 0;
    
    [self count12];
     //_animatedImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _animatedImageView.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed:@"logo1.png"],
                                          [UIImage imageNamed:@"logo2.png"],
                                          [UIImage imageNamed:@"logo3.png"],
                                          [UIImage imageNamed:@"logo4.png"],
                                          [UIImage imageNamed:@"logo5.png"],
                                          [UIImage imageNamed:@"logo6.png"],
                                          [UIImage imageNamed:@"logo7.png"],
                                          [UIImage imageNamed:@"logo8.png"],
                                          [UIImage imageNamed:@"logo9.png"],
                                          [UIImage imageNamed:@"logo10.png"], nil];
    _animatedImageView.animationDuration = 1.6f;
    _animatedImageView.animationRepeatCount = 0;
    [_animatedImageView startAnimating];
    [self.view addSubview: _animatedImageView];
}
- (IBAction)backs:(id)sender {
       [self.moviePlayerController2 stop];
    [timer23 invalidate];
    timer23 = nil;
    timercount13=0;
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
    StwoViewController *vc =[mainS instantiateViewControllerWithIdentifier:@"getOut"];
    [self.navigationController pushViewController: vc animated:YES];
 
}

- (void)count12{
    
    if(timercount13<1){
        [timer23 invalidate];
        timer23 = nil;
        [self loadMusixOuss2];
        
    }else{
        timercount13=timercount13-1;
        NSLog(@"%d",timercount13);
    }
}
-(void)parsGetOuss2{
    NSError *error = nil;
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL   URLWithString:@"https://itunes.apple.com/fr/rss/topsongs/limit=160/genre=21/json"]];
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    _myarrayJ =[[jsonObjects objectForKey:@"feed"]objectForKey:@"entry"];
    
    float low_bound = 0;
    float high_bound = 158 ;
    float rndValue = (((float)arc4random()/0x100000000)*(high_bound-low_bound)+low_bound);
    _testJ = [[NSNumber numberWithFloat:rndValue]intValue];
    NSArray * kola = [[_myarrayJ objectAtIndex:_testJ]objectForKey:@"link"];
    NSString * kas = [[[kola objectAtIndex:1]objectForKey:@"attributes"]objectForKey:@"href"];
    
    _song_url2=kas;
}



-(void)loadMusixOuss2{
    [self parsGetOuss2];
    
       self.moviePlayerController2.controlStyle = MPMovieControlStyleEmbedded;
    self.theMovieURL2 = [NSURL URLWithString:_song_url2];
    
    self.moviePlayerController2 = [[MPMoviePlayerController alloc] initWithContentURL: self.theMovieURL2];
    [self.moviePlayerController2 setControlStyle: MPMovieControlStyleNone];
    [self.view addSubview:self.moviePlayerController2.view];
    self.moviePlayerController2.movieSourceType = MPMovieSourceTypeStreaming;
    
    [self.moviePlayerController2 stop];
    [self.moviePlayerController2 setFullscreen:NO];
    [self.moviePlayerController2 prepareToPlay];
    
    timer23 =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count12) userInfo:nil repeats:YES];
    timercount13 = 16;
    
    [self count12];
    
}
 

@end