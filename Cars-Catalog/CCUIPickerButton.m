//
//  CCUIPickerButton.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCUIPickerButton.h"
#import "CCColorConstants.h"
#import "CCRequiredPickerButtonDelegate.h"

@implementation CCUIPickerButton

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = 3.0f;
    self.layer.borderColor = [ButtonBorderColor CGColor];
}

- (void)validate
{
    [self.delegate validate:self];
}

- (void)updateState
{
    UIColor *borderColor = ButtonBorderColor;

    if ([self isInvalid]) {
        borderColor = InvalidButtonBorderColor;
    }

    self.layer.borderColor = [borderColor CGColor];
}

@end
