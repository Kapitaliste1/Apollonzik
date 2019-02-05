//
//  ViewController.m
//  ApollonZik
//
//  Created by Gothi Musix on 20/11/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <Parse/Parse.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MozTopAlertView.h"
 


@interface ViewController ()
{
     }

@end
NSString * URLString;

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"Appollon"];
    
    self.navigationController.navigationBarHidden = YES;
    //apple watch
   
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getFacebookData) name:@"getFacebookData" object:nil];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    FBSDKProfilePictureView *profilePictureview = [[FBSDKProfilePictureView alloc]initWithFrame:_imageView.frame];
    //[profilePictureview setProfileID:result[@"id"]];
    [self.view addSubview:profilePictureview];
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"picture, email,first_name,last_name,id"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id res, NSError *error)
     {
         NSLog(@"%@", [res objectForKey:@"id"]);
         if (!error) {
             NSString *pictureURL = [NSString stringWithFormat:@"%@",[res objectForKey:@"picture"]];
             
             //  NSLog([NSString stringWithFormat:@"Donnees utilisateur = %@   %@     %@",[res objectForKey:@"first_name"],[res objectForKey:@"last_name"],[res objectForKey:@"email"]]);
             
             _infoProfile.text =[NSString stringWithFormat:@"%@ %@",[res objectForKey:@"first_name"],[res objectForKey:@"last_name"]];
             NSData  *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:pictureURL]];
             _imageView.image = [UIImage imageWithData:data];
             _idFbUser =[res objectForKey:@"id"];
             
             NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
             
             [defaults setObject:@"connected" forKey:@"log_state"];
             [defaults setObject:_idFbUser forKey:@"idFB"];
             [defaults synchronize];
             
             [self parseCompte];
         }
         else
         {
             NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
             
             [defaults setObject:@"disco" forKey:@"log_state"];
             [defaults synchronize];
             NSLog(@"%@", [error localizedDescription]);
         }}];
    profilePictureview.layer.cornerRadius = self.imageView.frame.size.width / 2;
    profilePictureview.clipsToBounds = YES;
    profilePictureview.layer.borderWidth = 3.0f;
    profilePictureview.layer.borderColor = [UIColor whiteColor].CGColor;
}
- (BOOL) connectedToInternet
{
    URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"] encoding:NSASCIIStringEncoding error:nil];
    if (URLString!= NULL) {
        URLString = @"connected";
        return YES;
    }else{
        URLString = @"not connected";
        return NO;
    }
}




-(void)parseCompte{
    
    //START
    
    PFQuery *query = [PFQuery queryWithClassName:@"Users"];
    [query whereKey:@"fb_id" equalTo:_idFbUser];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if(objects.count==0)
        {
            //ajout
            PFObject *users = [PFObject objectWithClassName:@"Users"];
            users[@"fb_id"] = _idFbUser;
            // users[@"Score"] = [NSNumber numberWithInt:(11)];
            [users saveInBackground];
            NSLog(@"FIRST TIME");
            //parse ajout end
            
        }else{
            
            //            for (PFObject *object in objects)
            //            {
            //                object[@"Score"]=[NSNumber numberWithInt:(10)];
            //                [object saveInBackground];
            NSLog(@"EXISTE");
            //  }
        }
    }];
    //OVER
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)getFacebookData{
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"first_name, last_name, picture.type(large), email, name, id, gender"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 
             }
         }];
    }
}

- (IBAction)playbtn:(id)sender {
    // determine screen size
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    
   
    NSString * stori ;
    _load.hidden =NO;
    [_load startAnimating];
    
    
    [self connectedToInternet];
    if ([URLString  isEqual: @"connected"]) {
        switch (screenHeight) {
                
                // iPhone 4s
            case 480:
                stori=@"Main-4S";
                break;
                
                // iPhone iPad
            case 1024:
                stori=@"Main-Pad";
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
        
       
        ViewController *vc =[mainS instantiateViewControllerWithIdentifier:@"homet"];
        
        [self.navigationController pushViewController: vc animated:NO];
        
    }else{
        [MozTopAlertView showWithType:MozAlertTypeWarning text:@"Need Internet" parentView:self.view];
    }
}



@end
