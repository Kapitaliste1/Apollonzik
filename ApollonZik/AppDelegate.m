//
//  AppDelegate.m
//  ApollonZik
//
//  Created by Gothi Musix on 20/11/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    
    
    // grab correct storyboard depending on screen height
     UIStoryboard *storyboard = [self grabStoryboard];
     _DB=[[DBManager alloc]initWithDatabaseFilename:@"Appollon"];
 

    // display storyboard
    self.window.rootViewController = [storyboard instantiateInitialViewController];
    [self.window makeKeyAndVisible];
   
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"YU5J3EuONzhHOST1JZsdbCARnQH2PP0uMvEOStNw"
                  clientKey:@"oDXcNgMglAXY84HzbxvaeyQLAseiUiBbbA8Favq3"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    // Override point for customization after application launch.
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    [application setStatusBarHidden:YES withAnimation:YES];
    return YES;
    
    
    
}



- (UIStoryboard *)grabStoryboard {
    
    // determine screen size
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIStoryboard *storyboard;
    
    switch (screenHeight) {
            
            // iPhone 4s
        case 480:
            storyboard = [UIStoryboard storyboardWithName:@"Main-4S" bundle:nil];
            break;
            
        case 1024:
            storyboard = [UIStoryboard storyboardWithName:@"Main-Pad" bundle:nil];
            break;
            
            // iPhone 6
        case 667:
            storyboard = [UIStoryboard storyboardWithName:@"Main-6" bundle:nil];
            break;
            
            // iPhone 6 Plus
        case 736:
            storyboard = [UIStoryboard storyboardWithName:@"Main-6-Plus" bundle:nil];
            break;
            
   
        default:
            // it's an 5s
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            break;
    }
    
    return storyboard;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  
}





- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}







-(void)loadLPOP
{
    
    NSString* requete=@"select MAX(pop) from Lyric";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
         NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    [ShareWatch setObject:mpo forKey:@"LPOP"];
    [ShareWatch synchronize];
}
-(void)loadLREGGAE
{
    
    NSString* requete=@"select MAX(reggae) from Lyric";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    [ShareWatch setObject:mpo forKey:@"LREGGAE"];
    [ShareWatch synchronize];
    
}
-(void)loadLRNB
{
    
    NSString* requete=@"select MAX(rnb) from Lyric";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
     NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    [ShareWatch setObject:mpo forKey:@"LRNB"];
    [ShareWatch synchronize];
    
}
-(void)loadLROCK
{
    
    NSString* requete=@"select MAX(rock) from Lyric";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    [ShareWatch setObject:mpo forKey:@"LROCK"];
    [ShareWatch synchronize];
}



-(void)loadMCOUNTRY
{
    NSString* requete=@"select MAX(country) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
   
    
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    [ShareWatch setObject:mpo forKey:@"MCOUNTRY"];
    [ShareWatch synchronize];
    
}
-(void)loadMJAZZ
{
    
    NSString* requete=@"select MAX(jazz) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    [ShareWatch setObject:mpo forKey:@"MJAZZ"];
    [ShareWatch synchronize];
}
-(void)loadMPOP
{
    
    NSString* requete=@"select MAX(pop) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
   
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    [ShareWatch setObject:mpo forKey:@"MPOP"];
    [ShareWatch synchronize];
}
-(void)loadMREGGAE
{
    
    NSString* requete=@"select MAX(reggae) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    [ShareWatch setObject:mpo forKey:@"MREGGAE"];
    [ShareWatch synchronize];
}
-(void)loadMRNB
{
    
    NSString* requete=@"select MAX(rnb) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    [ShareWatch setObject:mpo forKey:@"MRNB"];
    [ShareWatch synchronize];
    
    
}
-(void)loadMROCK
{
    
    NSString* requete=@"select MAX(rock) from Music";
    NSString * mpo = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requete]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpo = [mpo stringByReplacingOccurrencesOfString:@" " withString:@""];
   
    
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    [ShareWatch setObject:mpo forKey:@"MROCK"];
    [ShareWatch synchronize];
}


@end
