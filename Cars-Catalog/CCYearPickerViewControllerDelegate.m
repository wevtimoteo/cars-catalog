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
@property (assign, atomic) NSInteger selectedYearIndex;
@property (assign, atomic) NSInteger yearIndexTemporarySelection;

@end

@implementation CCYearPickerViewControllerDelegate

- (id)init
{
    self = [super init];
    if (self) {
        [self loadYearOptions];
    }
    return self;
}

- (void)loadYearOptions
{
    NSMutableArray *yearOptions = [[NSMutableArray alloc] init];
    for (int year = [self currentYear];
         year >= ([self currentYear] - 100); --year) {
        [yearOptions addObject:[NSString stringWithFormat:@"%d", year]];
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

#pragma mark - PickerViewControllerDelegate protocol

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.yearOptions[row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.yearOptions count];
}

- (void)donePickerViewController:(CCPickerViewController *)pickerViewController
{
    self.selectedYearIndex = self.yearIndexTemporarySelection;
}

- (void)cancelledPickerViewController:(CCPickerViewController *)pickerViewController
{
    self.yearIndexTemporarySelection = self.selectedYearIndex;
}

- (void)selectOptionWithTitle:(NSString *)title
{
    NSInteger index = [self.yearOptions indexOfObject:title];
    
    if (index != NSNotFound) {
        self.selectedYearIndex = index;
        self.yearIndexTemporarySelection = index;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.yearIndexTemporarySelection = row;
}

- (NSString *)selectedOptionTitle
{
    return self.yearOptions[self.selectedYearIndex];
}

- (NSInteger)selectedRowForComponent:(NSInteger)component
{
    return self.selectedYearIndex;
}

@end
