//
//  CCRequiredTextFieldDelegate.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCRequiredTextFieldDelegate.h"
#import "NSString+CCExtensions.h"

@implementation CCRequiredTextFieldDelegate

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

@end
