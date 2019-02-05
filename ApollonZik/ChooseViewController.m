//
//  ChooseViewController.m
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 20/01/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import "ChooseViewController.h"

@interface ChooseViewController ()

@end

@implementation ChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _genre = nil;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
 

- (IBAction)Rnb:(id)sender {
    _genre =@"15";
}



- (IBAction)jazz:(id)sender {
    _genre =@"11";
}
 

 
- (IBAction)country:(id)sender {
    _genre =@"6";
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    JazzViewController * v=[segue destinationViewController];
    v.genre = _genre;
    
}


- (IBAction)ROCKY:(id)sender {
    _genre =@"21";
}

- (IBAction)REGGAAE:(id)sender {
    _genre =@"24";
}

- (IBAction)POOOP:(id)sender {
    _genre =@"14";
}
@end
