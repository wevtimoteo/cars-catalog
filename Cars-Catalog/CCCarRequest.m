//
//  CCCarRequest.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/14/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarRequest.h"
#import "CCSettings.h"

@implementation CCCarRequest

+ (CCCarRequest *)buildWithRequestTarget:(UIViewController<CCRequestTarget> *)target
{
    CCCarRequest *carRequest = [[CCCarRequest alloc] init];
    carRequest.target = target;
    carRequest.httpClient = [[CCHttpClient alloc] init];

    return carRequest;
}

- (void)refresh
{
    [self.httpClient post:[self.car toDictionary] to:[CCSettings carsAddress] success: ^(AFHTTPRequestOperation *operation, id response) {
        [self.target dataRefreshed:CCResponseSuccess];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self.target dataRefreshed:CCResponseFailure];
    }];
}

@end
