//
//  CCRequiredPickerButtonDelegate.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCRequiredPickerButtonDelegate.h"

@implementation CCRequiredPickerButtonDelegate

- (id)initWithPickerViewController:(CCPickerViewController *)pickerViewController
{
    self = [self init];
    if (self) {
        self.pickerViewController = pickerViewController;
    }
    return self;
}

- (NSString *)requiredValidationMessage
{
    return @"Please select an option.";
}

- (void)validate:(CCUIPickerButton *)button
{
    button.isInvalid = !self.valid;
    button.validationMessage = [self requiredValidationMessage];
    [button updateState];
}

@end
