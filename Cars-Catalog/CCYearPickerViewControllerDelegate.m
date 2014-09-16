//
//  CCYearPickerViewControllerDelegate.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/16/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCYearPickerViewControllerDelegate.h"

@interface CCYearPickerViewControllerDelegate ()

@property (strong, nonatomic) NSArray *yearOptions;

@end

@implementation CCYearPickerViewControllerDelegate

- (void)loadYearOptions
{
    NSMutableArray *yearOptions = [[NSMutableArray alloc] init];
    for (int year = [self currentYear];
         year >= ([self currentYear] - 100); --year) {
        [yearOptions addObject:[NSNumber numberWithInt:year]];
    }

    self.yearOptions = [yearOptions copy];
}

#pragma mark - Private methods

- (int)currentYear
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    return [[formatter stringFromDate:[NSDate date]] intValue];
}

@end
