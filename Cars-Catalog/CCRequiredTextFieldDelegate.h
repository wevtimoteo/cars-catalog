//
//  CCRequiredTextFieldDelegate.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCTextFieldDelegate.h"
#import "CCUITextField.h"

@interface CCRequiredTextFieldDelegate : CCTextFieldDelegate

- (NSString *)requiredValidationMessage;
- (void)validate:(CCUITextField *)textField;

@end
