//
//  StwoViewController.h
//  ApollonZik
//
//  Created by Gothi on 02/12/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "DBManager.h"
@interface StwoViewController : UIViewController {
    NSTimer *timer23;
}
@property (weak, nonatomic) IBOutlet UIButton *back;

@property(strong,nonatomic) NSArray* myarrayJ;
@property int testJ;
@property (weak,nonatomic)NSString * singJ;
@property (strong, nonatomic) NSURL *theMovieURL2;
@property (strong, nonatomic) MPMoviePlayerController * moviePlayerController2;
@property (strong, nonatomic) IBOutlet UIImageView *animatedImageView;
- (IBAction)backs:(id)sender;
@property NSString* song_url2;


@property(strong,nonatomic) NSArray *Mytab;

@property(strong,nonatomic) DBManager *DB;
@end