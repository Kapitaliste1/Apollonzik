//
//  SharingController.m
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 15/02/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import "SharingController.h"

@interface SharingController ()

@end

@implementation SharingController

- (void)viewDidLoad {
    [super viewDidLoad];
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"Appollon"];
    [self loadsong];
    [self ShareScoreWithWatch];
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


-(void) ShareScoreWithWatch
{
    
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    
    
    //lyric
    //pop
    
    NSString* requetepop=@"select MAX(pop) from Lyric";
    NSString * mpop = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requetepop]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpop = [mpop stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpop = [mpop stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpop = [mpop stringByReplacingOccurrencesOfString:@" " withString:@""];
    [ShareWatch setObject:mpop forKey:@"LPOP"];
    
    
    //reggae
    NSString* requeterega=@"select MAX(reggae) from Lyric";
    NSString * mprega = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requeterega]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mprega = [mprega stringByReplacingOccurrencesOfString:@")" withString:@""];
    mprega = [mprega stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mprega = [mprega stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [ShareWatch setObject:mprega forKey:@"LREGGAE"];
    
    
    
    //rnb
    NSString* requeternb=@"select MAX(rnb) from Lyric";
    NSString * mprnb = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requeternb]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mprnb = [mprnb stringByReplacingOccurrencesOfString:@")" withString:@""];
    mprnb = [mprnb stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mprnb = [mprnb stringByReplacingOccurrencesOfString:@" " withString:@""];
    [ShareWatch setObject:mprnb forKey:@"LRNB"];
    
    
    
    //rock
    
    NSString* requeterock=@"select MAX(rock) from Lyric";
    NSString * mporock = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requeterock]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mporock = [mporock stringByReplacingOccurrencesOfString:@")" withString:@""];
    mporock = [mporock stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mporock = [mporock stringByReplacingOccurrencesOfString:@" " withString:@""];
    [ShareWatch setObject:mporock forKey:@"LROCK"];
    
    //countrym
    
    NSString* requetecountrym=@"select MAX(country) from Lyric";
    NSString * mpocountrym = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requetecountrym]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpocountrym = [mpocountrym stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpocountrym = [mpocountrym stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpocountrym = [mpocountrym stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [ShareWatch setObject:mpocountrym forKey:@"LCOUNTRY"];
    
    
    //jazzl
    NSString* requetejazzl=@"select MAX(jazz) from Lyric";
    NSString * mpojazzl = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requetejazzl]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpojazzl = [mpojazzl stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpojazzl = [mpojazzl stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpojazzl = [mpojazzl stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [ShareWatch setObject:mpojazzl forKey:@"LJAZZ"];
    
    
    
    //music
    
    //popM
    NSString* requetepopm=@"select MAX(pop) from Music";
    NSString * mpopm = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requetepopm]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpopm = [mpopm stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpopm = [mpopm stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpopm = [mpopm stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [ShareWatch setObject:mpopm forKey:@"MPOP"];
    
    
    //reggaem
    
    NSString* requetereggaem=@"select MAX(reggae) from Music";
    NSString * mporeggaem = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requetereggaem]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mporeggaem = [mporeggaem stringByReplacingOccurrencesOfString:@")" withString:@""];
    mporeggaem = [mporeggaem stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mporeggaem = [mporeggaem stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [ShareWatch setObject:mporeggaem forKey:@"MREGGAE"];
    
    
    
    //rnbm
    
    NSString* requeternbm=@"select MAX(rnb) from Music";
    NSString * mpornbm = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requeternbm]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpornbm = [mpornbm stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpornbm = [mpornbm stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpornbm = [mpornbm stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [ShareWatch setObject:mpornbm forKey:@"MRNB"];
    
    //rockm
    NSString* requeterockm=@"select MAX(rock) from Music";
    NSString * mporockm = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requeterockm]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mporockm = [mporockm stringByReplacingOccurrencesOfString:@")" withString:@""];
    mporockm = [mporockm stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mporockm = [mporockm stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    [ShareWatch setObject:mporockm forKey:@"MROCK"];
    
    //jazzM
    
    NSString* requetecntry=@"select MAX(country) from Music";
    NSString * mpocntry = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requetecntry]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpocntry = [mpocntry stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpocntry = [mpocntry stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpocntry = [mpocntry stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [ShareWatch setObject:mpocntry forKey:@"MCOUNTRY"];
    
    
    //jazz
    NSString* requetejazz=@"select MAX(jazz) from Music";
    NSString * mpojazz = [[NSString stringWithFormat:@"%@",[_DB loadDataFromDB:requetejazz]] stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mpojazz = [mpojazz stringByReplacingOccurrencesOfString:@")" withString:@""];
    mpojazz = [mpojazz stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    mpojazz = [mpojazz stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [ShareWatch setObject:mpojazz forKey:@"MJAZZ"];
    
    //synch data
    
    [ShareWatch synchronize];
    
    NSLog(@"from your first view bro  %@", mpocntry);
}
-(void)loadsong
{
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];

    NSString* requete=@"select * from Favoris ";
    
    self.shareFavoris=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete]];
    
    
    [ShareWatch setObject:self.shareFavoris forKey:@"FAVORIS"];

 
       [ShareWatch synchronize];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [self loadsong];
    
}

@end
