//
//  ChooseViewController.h
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 20/01/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JazzViewController.h"
#import "StageViewController.h"
@interface ChooseViewController : UIViewController
 

- (IBAction)Rnb:(id)sender;

- (IBAction)jazz:(id)sender;

 
- (IBAction)country:(id)sender;

@property(weak,nonatomic) NSString * genre;

- (IBAction)ROCKY:(id)sender;


- (IBAction)REGGAAE:(id)sender;

- (IBAction)POOOP:(id)sender;



@end
