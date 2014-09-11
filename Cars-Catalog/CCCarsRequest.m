//
//  CCCarsRequest.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/10/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarsRequest.h"

@implementation CCCarsRequest

+ (CCCarsRequest *)buildWithRequestTarget:(UITableViewController<CCRequestTarget> *)target
{
    CCCarsRequest *carsRequest = [[CCCarsRequest alloc] init];
    carsRequest.target = target;

    return carsRequest;
}

@end
