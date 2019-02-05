//
//  FavouriteViewController.h
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 29/12/15.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "WebViewController.h"
#import "StageViewController.h"
@interface FavouriteViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tab;

@property(strong,nonatomic) NSArray *Mytab;
@property(strong,nonatomic) NSArray *score;

@property(strong,nonatomic) DBManager *DB;
@property (weak, nonatomic) IBOutlet UILabel *LScore;
@property (weak, nonatomic) IBOutlet UILabel *SScore;

-(void)loadsong;
@end
