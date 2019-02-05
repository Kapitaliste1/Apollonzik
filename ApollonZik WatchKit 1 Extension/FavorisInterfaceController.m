//
//  FavorisInterfaceController.m
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 15/02/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import "FavorisInterfaceController.h"
#import "ICBQuoteTableRow.h"

@interface FavorisInterfaceController ()
@property (nonatomic, strong) NSArray *quotes;
@property int k ;
@end

@implementation FavorisInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.k = 0;
    // Configure interface objects here.
    NSUserDefaults * ShareWatch = [[NSUserDefaults alloc]initWithSuiteName:@"group.apollonzik"];
    
    //Lyric
     // Get quotes
    self.quotes = [ShareWatch arrayForKey:@"FAVORIS"];
    
    
     [ShareWatch synchronize];
    
    // Set number of table Row
    [self.table setNumberOfRows:self.quotes.count withRowType:@"QuoteTableRow"];
    
    // Set row properties
    for (NSIndexPath * i in  self.quotes ) {
        self.k ++;
            ICBQuoteTableRow *quoteRow = [self.table rowControllerAtIndex:[self.quotes indexOfObject:i]];
        if (self.k < self.quotes.count) {
            [quoteRow.characterNameLabel setText:[NSString stringWithFormat:@"%@",[[self.quotes objectAtIndex:self.k ]objectAtIndex:2]]];
            [quoteRow.quoteLabel setText:[NSString stringWithFormat:@"%@",[[self.quotes objectAtIndex:self.k ]objectAtIndex:1]]];
        }
        
    }

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



