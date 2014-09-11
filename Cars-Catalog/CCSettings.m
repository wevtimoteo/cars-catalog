//
//  CCSettings.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/10/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCSettings.h"

@implementation CCSettings

+ (NSString *)carsAddress
{
    return [NSString stringWithFormat:@"%@/1/classes/Carros", self.configurations[@"apiAddress"]];
}

+ (NSString *)apiApplicationId
{
    return self.configurations[@"apiApplicationId"];
}

+ (NSString *)apiKey
{
    return self.configurations[@"apiKey"];
}

#pragma mark - helper methods

+ (NSDictionary *)configurations
{
    static NSDictionary *configurations = nil;

    if (!configurations) {
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *path = [mainBundle pathForResource:@"Settings" ofType:@"plist"];
        configurations = [NSDictionary dictionaryWithContentsOfFile:path];
    }

    return configurations;
}

@end
