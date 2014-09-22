//
//  CCRequiredPickerButtonDelegate.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCUIPickerButton.h"
#import "CCPickerViewController.h"

@interface CCRequiredPickerButtonDelegate : NSObject

@property (weak, atomic) CCPickerViewController *pickerViewController;
@property (assign, atomic) BOOL valid;

- (id)initWithPickerViewController:(CCPickerViewController *)pickerViewController;
- (NSString *)requiredValidationMessage;
- (void)validate:(CCUIPickerButton *)button;

@end
