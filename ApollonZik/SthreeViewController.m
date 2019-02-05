//
//  SthreeViewController.m
//  ApollonZik
//
//  Created by Gothi on 02/12/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import "SthreeViewController.h"

@interface SthreeViewController ()

@end

@implementation SthreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieEventFullscreenHandler:)
                                                 name:MPMoviePlayerWillEnterFullscreenNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieEventFullscreenHandler:)
                                                 name:MPMoviePlayerDidEnterFullscreenNotification
                                               object:nil];
    
    self.moviePlayerController3.controlStyle = MPMovieControlStyleEmbedded;
    self.theMovieURL3 = [NSURL URLWithString:@"http://a330.phobos.apple.com/us/r1000/104/Music/dc/18/32/mzm.dccbozoi.aac.p.m4a"];
    
    self.moviePlayerController3 = [[MPMoviePlayerController alloc] initWithContentURL: self.theMovieURL3];
    [self.moviePlayerController3 setControlStyle: MPMovieControlStyleNone];
    [self.view addSubview:self.moviePlayerController3.view];
    self.moviePlayerController3.movieSourceType = MPMovieSourceTypeStreaming;
    
    [self.moviePlayerController3 setFullscreen:NO];
    [self.moviePlayerController3 prepareToPlay];
    
}
- (void)movieEventFullscreenHandler:(NSNotification*)notification {
    [self.moviePlayerController3 setFullscreen:NO animated:NO];
    [self.moviePlayerController3 setControlStyle:MPMovieControlStyleEmbedded];
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

- (IBAction)b31:(id)sender {
}

- (IBAction)b32:(id)sender {
}

- (IBAction)b33:(id)sender {
}
@end
