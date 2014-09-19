//
//  CCCarFormViewController.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/14/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarFormViewController.h"
#import "CCYearPickerViewController.h"
#import "CCYearPickerViewControllerDelegate.h"
#import "CCCar.h"

@interface CCCarFormViewController ()

@property (strong, atomic) CCYearPickerViewController *yearPickerViewController;
@property (strong, atomic) CCYearPickerViewControllerDelegate *yearPickerDelegate;

- (IBAction)pickYear:(__unused id)sender;
- (IBAction)addCar:(__unused id)sender;

@end

@implementation CCCarFormViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.carRequest = [CCCarRequest buildWithRequestTarget:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupAppearance];
    [self setupComponents];
}

#pragma mark - CCRequestTarget protocol

- (void)dataRefreshed:(CCResponseStatus)status
{
    if (status == CCResponseSuccess) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [[UIAlertView alloc] initWithTitle:@"Error to create car" message:@"There was an error while creating car. Try again" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];

    }
}

#pragma mark - Setup Appearance

- (void)setupAppearance
{
   self.navigationItem.title = @"Add Car";

    [self.formScrollView addSubview:self.formView];
    self.formScrollView.contentSize = self.formView.frame.size;
}

- (void)setupComponents
{
    [self.yearButton setTitle:@"Select..." forState:UIControlStateNormal];

    [self setupYearPicker];
}

#pragma mark - Setup picker

- (void)setupYearPicker
{
    self.yearPickerDelegate = [[CCYearPickerViewControllerDelegate alloc] init];
    self.yearPickerViewController = [[CCYearPickerViewController alloc] initWithPickerButton:self.yearButton parent:self delegate:self.yearPickerDelegate];
}

#pragma mark - UI Actions

- (IBAction)pickYear:(__unused id)sender {
    [self.yearPickerViewController pick];
}

- (IBAction)addCar:(id)sender
{
    CCCar *car = [[CCCar alloc] initFromDictionary:[self getFormData]];
    self.carRequest.car = car;
    [self.carRequest refresh];
}

#pragma mark - Helpers

- (NSDictionary *)getFormData
{
    return @{
        @"Nome": self.modelNameTextField.text,
        @"Fabricante": self.manufacturerTextField.text,
        @"Quilometragem": self.kilometersTextField.text,
        @"Ano": [self.yearPickerViewController year]
    };
}

@end
