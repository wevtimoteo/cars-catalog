//
//  CCUITextField.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCUITextField.h"
#import "CCColorConstants.h"

@implementation CCUITextField

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = 3.0f;
    self.layer.borderColor = [TextFieldBorderColor CGColor];
}

- (void)validate
{
    [self.delegate performSelector:@selector(validate:) withObject:self];
}

- (void)updateState
{
    UIColor *borderColor = TextFieldBorderColor;

    if ([self isInvalid]) {
        borderColor = InvalidTextFieldBorderColor;
    }

    self.layer.borderColor = [borderColor CGColor];
}

@end
