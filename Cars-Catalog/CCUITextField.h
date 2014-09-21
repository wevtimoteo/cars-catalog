//
//  CCUITextField.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCUITextField : UITextField

@property (copy, atomic) NSString *validationMessage;
@property (assign, atomic) BOOL isInvalid;

- (void)validate;
- (void)updateState;

@end
