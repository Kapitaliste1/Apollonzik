//
//  StageViewController.m
//  ApollonZik
//
//  Created by Gothi on 02/12/2015.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import "StageViewController.h"

@interface StageViewController ()

@end

NSString* remix = @"";
@implementation StageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"Appollon"];
    // Do any additional setup after loading the view.
    _genreType=@"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
        SoneViewController *svc = [segue destinationViewController];
        [svc setStrGenre:_genreType];
    svc.genre = _genreType;
}


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
- (IBAction)RockBtn:(id)sender {
    _genreType = @"21";
    remix=@"";
}
- (IBAction)CountryBtn:(id)sender {
    _genreType = @"6";
    remix=@"";
    
}

- (IBAction)ReggaeBtn:(id)sender {
    _genreType = @"24";
    remix=@"";
    
}

- (IBAction)RnbBtn:(id)sender {
    _genreType = @"15";
    remix=@"";
    
}
- (IBAction)Jazz:(id)sender {
    _genreType = @"11";
    remix=@"";
    
}

- (IBAction)PopBtn:(id)sender {
    _genreType = @"14";
    remix=@"";
}

- (IBAction)RemixBtn:(id)sender {
    remix = @"remix";
}

@end
