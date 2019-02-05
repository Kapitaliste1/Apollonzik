//
//  EndViewController.m
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 25/01/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import "EndViewController.h"

@interface EndViewController ()

@end

@implementation EndViewController

- (void)viewDidLoad {
   
    
    
    [super viewDidLoad];
    
    NSLog(@"score :%d ",self.score );
    NSLog(@"%@",self.linkArray);
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


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSString *identifer = @"mycelle";
    NSString* Stitre;
    
    UITableViewCell* mycell=[tableView dequeueReusableCellWithIdentifier:identifer forIndexPath:indexPath];
    
    
    
    //mycell.textLabel.text= [NSString stringWithFormat:@"%@ " " " "%@",nom,prenom];
    //mycell.detailTextLabel.text=age;
    
    
     UILabel *TheTitle = (UILabel *)[tableView viewWithTag:1];
    
    switch (indexPath.section) {
        case 0:
            
            Stitre= [self.SingerArray objectAtIndex:indexPath.row];
            
            
           TheTitle.text = [NSString stringWithFormat:@"%@",Stitre];
            
            
            
            
            
            
            break;
            
            
        default:
            
            break;
    }
    
    
    return  mycell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return [self.SingerArray count];
            break;
        
            
        default:
            return 0;
            break;
    }
    
}

- (IBAction)Quitter:(id)sender {
    
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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController * v=[segue destinationViewController];
    NSIndexPath *myIndex = [self.Mytab indexPathForSelectedRow] ;
    v.lien =[NSString stringWithFormat:@"%@",[self.linkArray objectAtIndex:myIndex.row]];
    
   
}


@end
