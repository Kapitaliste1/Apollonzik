//
//  ScoreViewController.m
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 03/01/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ScoreViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
@interface ScoreViewController ()


@end

@implementation ScoreViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"Appollon"];
    
     [self loadLJAZZ];
    
    [self loadLCOUNTRY];
   
    [self loadLPOP];
    [self loadLREGGAE];
    [self loadLRNB];
    [self loadLROCK];
    
    
    [self loadMCOUNTRY];
    [self loadMJAZZ];
    [self loadMPOP];
    [self loadMREGGAE];
    [self loadMRNB];
    [self loadMROCK];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)loadLJAZZ
{
    
    NSString* requete=@"select MAX(jazz) from Lyric";
 
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _LJAZZ.text =mpo;
    NSLog(@"%@",mpo);
    
    
  
    
    
    
}

 -(void)loadLCOUNTRY
 {
 
 NSString* requete=@"select MAX(country) from Lyric";
     NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
     mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
     mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
     mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
     
 _LCOUNTRY.text = mpo;
   

 }
-(void)loadLPOP
{
    
    NSString* requete=@"select MAX(pop) from Lyric";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _LPOP.text =mpo;
    
}
-(void)loadLREGGAE
{
    
    NSString* requete=@"select MAX(reggae) from Lyric";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _LREAGGAE.text =mpo;
   
}
-(void)loadLRNB
{
    
    NSString* requete=@"select MAX(rnb) from Lyric";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _LRNB.text =mpo;
    
    
}
-(void)loadLROCK
{
    
    NSString* requete=@"select MAX(rock) from Lyric";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _LROCK.text = mpo;
    
   
}



-(void)loadMCOUNTRY
{
    NSString* requete=@"select MAX(country) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _MCOUNTRY.text = mpo;
    
  
    
}
-(void)loadMJAZZ
{
    
    NSString* requete=@"select MAX(jazz) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _MJAZZ.text = mpo;
    
}
-(void)loadMPOP
{
    
    NSString* requete=@"select MAX(pop) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _MPOP.text = mpo;
    
}
-(void)loadMREGGAE
{
    
    NSString* requete=@"select MAX(reggae) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _MREGGAE.text =mpo;
    
}
-(void)loadMRNB
{
    
    NSString* requete=@"select MAX(rnb) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _MRNB.text =mpo;
    
 

}
-(void)loadMROCK
{
    
    NSString* requete=@"select MAX(rock) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    _MROCK.text = mpo;
    
    
}

- (IBAction)shareBtn:(id)sender {
    SLComposeViewController *controllerSLC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [controllerSLC setInitialText:@"My scores :D can you beat me ?"];
    [controllerSLC addImage:[self captureScreen]];
    [self presentViewController:controllerSLC animated:YES completion:Nil];
}

-(void)shareTwitter{
    SLComposeViewController *controllerSLC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [controllerSLC setInitialText:@"My scores :D can you beat me ?"];
    [controllerSLC addImage:[self captureScreen]];
    [self presentViewController:controllerSLC animated:YES completion:Nil];
}






/*

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)btnBack:(id)sender {
    
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



    - (UIImage *) captureScreen {
        UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
        CGRect rect = [keyWindow bounds];
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [keyWindow.layer renderInContext:context];
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    
}
@end
