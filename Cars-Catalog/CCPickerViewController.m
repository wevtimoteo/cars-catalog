//
//  CCPickerViewController.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/14/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCPickerViewController.h"

@interface CCPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation CCPickerViewController

- (id)initWithPickerButton:(UIButton *)pickerButton parent:(UIViewController *)parent delegate:(id<CCPickerViewControllerDelegate>)delegate
{
    self = [super init];

    if (self) {
        self.pickerButton = pickerButton;
        self.parent = parent;
        self.delegate = delegate;
        [self.delegate setPickerViewController:self];
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.picker.dataSource = self.delegate;
    self.picker.delegate = self.delegate;

}

- (void)selectOptionWithTitle:(NSString *)title
{
    [self.delegate selectOptionWithTitle:title];

    NSInteger componentCount = [self.delegate numberOfComponentsInPickerView:self.picker];

    for (NSInteger i = 0; i < componentCount; i++) {
        NSInteger row = [self.delegate selectedRowForComponent:i];
        [self.picker selectRow:row inComponent:i animated:YES];
    }
}

#pragma mark - UI Actions

- (void)pick
{
    [self.parent.view endEditing:NO];
}

- (IBAction)cancel:(id)sender
{
    [self.delegate donePickerViewController:self];
}

- (IBAction)done:(id)sender
{
    [self.delegate cancelledPickerViewController:self];
}

@end
