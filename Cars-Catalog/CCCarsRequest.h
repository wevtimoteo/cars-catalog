//
//  CCCarsRequest.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/10/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCar.h"
#import "CCHttpClient.h"
#import "CCRequestTarget.h"

@interface CCCarsRequest : NSObject

@property (assign, nonatomic) UITableViewController<CCRequestTarget> *target;
@property (strong, nonatomic) NSArray *cars;
@property (strong, nonatomic) CCHttpClient *httpClient;

+ (CCCarsRequest *)buildWithRequestTarget:(UITableViewController<CCRequestTarget> *)target;
- (CCCar *)atIndex:(NSInteger)index;
- (NSInteger)count;
- (void)refresh;

@end
