//
//  NSString+CCExtensions.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "NSString+CCExtensions.h"

@implementation NSString (CCExtensions)

- (BOOL)isEmpty
{
    NSString *trimmedSelf = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [trimmedSelf length] == 0;
}

@end
