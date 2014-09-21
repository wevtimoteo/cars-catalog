//
//  CCUITextField.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCUITextField.h"

@implementation CCUITextField

- (void)validate
{
    [self.delegate performSelector:@selector(validate:) withObject:self];
}

@end
