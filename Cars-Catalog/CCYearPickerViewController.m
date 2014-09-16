//
//  CCYearPickerViewController.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/15/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCYearPickerViewController.h"

@interface CCYearPickerViewController ()

@end

@implementation CCYearPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:@"CCPickerViewController" bundle:nibBundleOrNil];
}

- (void)pick
{
    [super pick];
    
    [self.parent presentViewController:self animated:YES completion:nil];
    
    NSString *optionTitle = [self.pickerButton titleForState:UIControlStateNormal];
    [self selectOptionWithTitle:optionTitle];
}

- (void)done:(id)sender
{
    [super done:sender];
    [self.pickerButton setTitle:[self.delegate selectedOptionTitle] forState:UIControlStateNormal];
    [self.parent dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancel:(id)sender
{
    [super cancel:sender];
    [self.parent dismissViewControllerAnimated:YES completion:nil];
}

@end