//
//  CCCarFormViewController.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/14/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarFormViewController.h"
#import "CCRequiredTextFieldDelegate.h"
#import "CCRequiredPickerButtonDelegate.h"
#import "CCYearPickerViewController.h"
#import "CCYearPickerViewControllerDelegate.h"
#import "CCCar.h"
#import "CCMessage.h"
#import "CCColorConstants.h"

@interface CCCarFormViewController ()

@property (strong, atomic) CCYearPickerViewController *yearPickerViewController;
@property (strong, atomic) CCYearPickerViewControllerDelegate *yearPickerDelegate;

@property (strong, atomic) NSArray *fieldsToValidate;

- (IBAction)pickYear:(__unused id)sender;
- (IBAction)addCar:(__unused id)sender;

@end

@implementation CCCarFormViewController
{
    CCRequiredTextFieldDelegate *requiredTextFieldDelegate;
}

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
    [self setupBehavior];
}

#pragma mark - CCRequestTarget protocol

- (void)dataRefreshed:(CCResponseStatus)status
{
    if (status == CCResponseSuccess) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Unable to add car" message:@"There was an error when adding car. Please check your connection and try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];

    }
}

#pragma mark - Setup Appearance

- (void)setupAppearance
{
    self.navigationItem.title = @"Add Car";

    [self.formScrollView setBackgroundColor:ScreenBackgroundColor];
    [self.formView setBackgroundColor:[UIColor clearColor]];

    self.addCarButton.backgroundColor = ButtonBackgroundColor;
    self.addCarButton.layer.borderColor = [ButtonBorderColor CGColor];

    [self.formScrollView addSubview:self.formView];
    self.formScrollView.contentSize = self.formView.frame.size;
}

- (void)setupComponents
{
    [self.yearButton setTitle:@"Select..." forState:UIControlStateNormal];

    [self setupYearPicker];
}

#pragma mark - Setup behavior

- (void)setupBehavior
{
    requiredTextFieldDelegate = [[CCRequiredTextFieldDelegate alloc] init];

    self.modelNameTextField.delegate = requiredTextFieldDelegate;
    self.manufacturerTextField.delegate = requiredTextFieldDelegate;
    self.kilometersTextField.delegate = requiredTextFieldDelegate;
    self.yearButton.delegate = self.yearPickerDelegate;

    self.fieldsToValidate = @[self.modelNameTextField, self.manufacturerTextField, self.yearButton, self.kilometersTextField];
}

#pragma mark - Setup picker

- (void)setupYearPicker
{
    self.yearPickerDelegate = [[CCYearPickerViewControllerDelegate alloc] init];
    self.yearPickerViewController = [[CCYearPickerViewController alloc] initWithPickerButton:self.yearButton parent:self delegate:self.yearPickerDelegate];
    self.yearPickerDelegate.pickerViewController = self.yearPickerViewController;
}

#pragma mark - UI Actions

- (IBAction)pickYear:(__unused id)sender {
    [self.yearPickerViewController pick];
}

- (IBAction)addCar:(id)sender
{
    if ([self allFieldsAreValid]) {
        CCCar *car = [[CCCar alloc] initFromDictionary:[self getFormData]];
        self.carRequest.car = car;
        [self.carRequest refresh];
    } else {
        [CCMessage showAlert:@"Form validation failed. Please check all red bordered fields."];
    }
}

#pragma mark - Private

- (NSDictionary *)getFormData
{
    return @{
        @"Nome": self.modelNameTextField.text,
        @"Fabricante": self.manufacturerTextField.text,
        @"Quilometragem": self.kilometersTextField.text,
        @"Ano": [self.yearPickerViewController year]
    };
}

- (BOOL)allFieldsAreValid
{
    BOOL anyFieldInvalid = NO;
    
    for (id field in self.fieldsToValidate) {
        [field validate];
        anyFieldInvalid = anyFieldInvalid || [field isInvalid];
    }
    
    return !anyFieldInvalid;
}

@end
