//
//  FavouriteViewController.m
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 29/12/15.
//  Copyright © 2015 Gothi Musix. All rights reserved.
//

#import "FavouriteViewController.h"

@interface FavouriteViewController ()

@end

@implementation FavouriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"Appollon"];
    
    [self loadsong];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewDidAppear:(BOOL)animated
{
    [self loadsong];
    [_tab reloadData];
}



-(void)loadsong
{

    NSString* requete=@"select * from Favoris ";
    
    self.Mytab=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete]];
   
    
  }


-(void)loadscore
{
    
    NSString* req=@"select * from User ";
    
    self.score=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:req]];
    
   NSInteger indc=[_DB.arrColumnNames indexOfObject:@"Music"];
    
    self.SScore.text=[[self.score objectAtIndex:1]objectAtIndex:indc];
    
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [self.Mytab count];
            // return _Mytab.count;
            break;
        
        
            
        default:
            return 0;
            break;
    }
   
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    
    NSInteger indicechanteur;
    NSInteger indicetitre;
    NSString *identifer = @"mycell";
    NSString* Stitre;
    NSString* Schanteur;
    UITableViewCell* mycell=[tableView dequeueReusableCellWithIdentifier:identifer forIndexPath:indexPath];
  
    
    
    //mycell.textLabel.text= [NSString stringWithFormat:@"%@ " " " "%@",nom,prenom];
    //mycell.detailTextLabel.text=age;
    
    
    
    
    UILabel *TheTitle = (UILabel *)[tableView viewWithTag:1];
    
    UILabel *TheSong = (UILabel *)[tableView viewWithTag:2];
   
    
    switch (indexPath.section) {
        case 0:
            
            indicetitre=[_DB.arrColumnNames indexOfObject:@"Titre"];
            
            Stitre=[[self.Mytab objectAtIndex:indexPath.row]objectAtIndex:indicetitre];
            indicechanteur=[_DB.arrColumnNames indexOfObject:@"Chanteur"];
            Schanteur=[[self.Mytab objectAtIndex:indexPath.row]objectAtIndex:indicechanteur];
            
            
            TheTitle.text = [NSString stringWithFormat:@"%@",Stitre];
            
            TheSong.text = [NSString stringWithFormat:@"%@", Schanteur];
            
            break;
        
      
        default:
            
            break;
    }
    
    
    return  mycell;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
        NSInteger indiceselect=[_tab indexPathForSelectedRow].row;
        
        WebViewController * v=[segue destinationViewController];
        
        NSInteger indicenom=[_DB.arrColumnNames indexOfObject:@"Titre"];
        NSString* nom=[[_Mytab objectAtIndex:indiceselect]objectAtIndex:indicenom];
        
        NSInteger indiceprenom=[_DB.arrColumnNames indexOfObject:@"Chanteur"];
        NSString* prenom=[[_Mytab objectAtIndex:indiceselect]objectAtIndex:indiceprenom];
        
        v.lien = [NSString stringWithFormat:@"https://www.youtube.com/results?search_query=%@+%@",nom,prenom];
      
}

- (IBAction)btnBack:(id)sender {
    
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    NSString * stori ;
    
    
    switch (screenHeight) {
            
            // iPhone 4s
        case 480:
            stori=@"Main-4S";
            break;
            
            // iPhone iPad
       
            
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
