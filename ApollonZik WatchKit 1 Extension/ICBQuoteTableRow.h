//
//  ICBQuoteTableRow.h
//  ApollonZik
//
//  Created by Kapitaliste Jonathan on 15/02/16.
//  Copyright © 2016 Gothi Musix. All rights reserved.
//

#import <Foundation/Foundation.h>
@import WatchKit;
@interface ICBQuoteTableRow : NSObject
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *characterNameLabel;
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *quoteLabel;
@end
