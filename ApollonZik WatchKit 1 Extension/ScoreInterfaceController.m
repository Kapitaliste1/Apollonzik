//
//  ScoreInterfaceController.m
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 15/02/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import "ScoreInterfaceController.h"

@interface ScoreInterfaceController ()

@end

@implementation ScoreInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    
    //Lyric
    [_Lcountry setText:[ShareWatch stringForKey:@"LCOUNTRY"]];
    [_Ljazz setText:[ShareWatch stringForKey:@"LJAZZ"]];
    [_Lrnb setText:[ShareWatch stringForKey:@"LRNB"]];
    [_Lpop setText:[ShareWatch stringForKey:@"LPOP"]];
    [_Lreaggae setText:[ShareWatch stringForKey:@"LREGGAE"]];
    [_Lrock setText:[ShareWatch stringForKey:@"LROCK"]];

    //Music
    
    [_Mrock setText:[ShareWatch stringForKey:@"MROCK"]];
    [_Mpop setText:[ShareWatch stringForKey:@"MPOP"]];
    [_Mjazz setText:[ShareWatch stringForKey:@"MJAZZ"]];
    [_Mrnb setText:[ShareWatch stringForKey:@"MRNB"]];
    [_Mcountry setText:[ShareWatch stringForKey:@"MCOUNTRY"]];
    [_Mraeggae setText:[ShareWatch stringForKey:@"MREGGAE"]];




    
    
   
    
    NSLog(@"country montre %@",[ShareWatch stringForKey:@"MCOUNTRY"]);
    [ShareWatch synchronize];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



