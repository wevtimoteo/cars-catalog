//
//  CCCar.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/12/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCar.h"

@implementation CCCar

- (id)initFromDictionary:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.objectId = data[@"objectId"];
        self.modelName = data[@"Nome"];
        self.year      = [data[@"Ano"] integerValue];
        self.traveledKilometers = [data[@"Quilometragem"] integerValue];
        self.manufacturer = data[@"Fabricante"];
        self.createdAt = [self dateFromString:data[@"createdAt"]];
        self.updatedAt = [self dateFromString:data[@"updatedAt"]];
    }
    return self;
}

#pragma mark - helper methods

- (NSDate *)dateFromString:(NSString *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];

    return [dateFormatter dateFromString:date];
}

@end
