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

@interface CCCarFormViewController ()

@property (strong, atomic) CCYearPickerViewController *yearPickerViewController;
@property (strong, atomic) CCYearPickerViewControllerDelegate *yearPickerDelegate;

- (IBAction)pickYear:(__unused id)sender;

@end

@implementation CCCarFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupAppearance];
    [self setupComponents];
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

@end
