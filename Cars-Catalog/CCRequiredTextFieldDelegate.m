//
//  CCRequiredTextFieldDelegate.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCRequiredTextFieldDelegate.h"
#import "CCMessage.h"
#import "NSString+CCExtensions.h"

@implementation CCRequiredTextFieldDelegate

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(CCUITextField *)textField
{
    [self showValidationMessageForTextField:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [CCMessage dismissMessage];
}

#pragma mark - Public interface messages

- (NSString *)requiredValidationMessage
{
    return @"This field is required.";
}

- (void)validate:(CCUITextField *)textField
{
    textField.isInvalid = [textField.text isEmpty];
    textField.validationMessage = [self requiredValidationMessage];
}

#pragma mark - Private

- (void)showValidationMessageForTextField:(CCUITextField *)textField
{
    if (textField.isInvalid) {
        [CCMessage showAlert:textField.validationMessage];
    }
}

@end
