//
//  CCUIPickerButton.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCRequiredPickerButtonDelegate;

@interface CCUIPickerButton : UIButton

@property (copy, atomic) NSString *validationMessage;
@property (assign, atomic) BOOL isInvalid;

@property (weak, atomic) CCRequiredPickerButtonDelegate *delegate;

- (void)validate;
- (void)updateState;

@end
