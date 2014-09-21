//
//  CCTextFieldDelegate.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCTextFieldDelegate.h"

@implementation CCTextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *candidateText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return candidateText.length <= [self maxLength];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

#pragma mark - Private

- (NSInteger)maxLength
{
    return 170;
}

@end
