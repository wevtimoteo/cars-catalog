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
    self = [super initWithNibName:@"CCPickerViewController" bundle:nibBundleOrNil];
    if (self) {
        self.year = @"";
    }
    return self;
}

- (void)pick
{
    [super pick];

    self.parent.navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.view.backgroundColor = [UIColor clearColor];

    [self.parent presentViewController:self animated:YES completion:nil];

    NSString *optionTitle = [self.pickerButton titleForState:UIControlStateNormal];
    [self selectOptionWithTitle:optionTitle];
}

- (void)done:(id)sender
{
    [super done:sender];
    [self.pickerButton setTitle:[self.delegate selectedOptionTitle] forState:UIControlStateNormal];
    [self.parent dismissViewControllerAnimated:YES completion:nil];
    self.year = [self.delegate performSelector:@selector(selectedOptionTitle)];
}

- (void)cancel:(id)sender
{
    [super cancel:sender];
    [self.parent dismissViewControllerAnimated:YES completion:nil];
}

@end
