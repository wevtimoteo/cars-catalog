//
//  CCCarsRequest.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/10/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarsRequest.h"
#import "CCCar.h"
#import "CCSettings.h"

@implementation CCCarsRequest

+ (CCCarsRequest *)buildWithRequestTarget:(UITableViewController<CCRequestTarget> *)target
{
    CCCarsRequest *carsRequest = [[CCCarsRequest alloc] init];
    carsRequest.target = target;
    carsRequest.httpClient = [[CCHttpClient alloc] init];

    return carsRequest;
}

- (NSInteger)count
{
    return [self.cars count];
}

- (void)refresh
{
    NSMutableArray *cars = [[NSMutableArray alloc] init];

    [self.httpClient get:[CCSettings carsAddress] success:^(AFHTTPRequestOperation *operation, id response) {
        for (NSDictionary *each in response[@"results"]) {
            CCCar *car = [[CCCar alloc] initFromDictionary:each];
            [cars addObject:car];
        }
        self.cars = [[NSArray alloc] initWithArray:cars];
        [self.target dataRefreshed:CCResponseSuccess];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self.target dataRefreshed:CCResponseFailure];
    }];
}

@end
