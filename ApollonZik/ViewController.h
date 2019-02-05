//
//  ViewController.h
//  ApollonZik
//
//  Created by Gothi Musix on 20/11/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <AVKit/AVKit.h>

#import "DBManager.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *infoProfile;
- (IBAction)playbtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn_p;
@property NSString* idFbUser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;

@property(strong,nonatomic) NSArray *Mytab;

@property(strong,nonatomic) DBManager *DB;


@end

