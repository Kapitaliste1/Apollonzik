//
//  EndViewController.h
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 25/01/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageViewController.h"
#import "JazzViewController.h"
@interface EndViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *Mytab;
 
@property int  score; 
@property(weak,nonatomic) NSString * lien;

- (IBAction)Quitter:(id)sender;

@property(strong,nonatomic) NSMutableArray *linkArray;

@property(strong,nonatomic) NSMutableArray *SingerArray;
@end
