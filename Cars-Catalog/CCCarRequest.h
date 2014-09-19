//
//  CCCarRequest.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/14/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCar.h"
#import "CCRequestTarget.h"
#import "CCHttpClient.h"

@interface CCCarRequest : NSObject

@property (assign, nonatomic) UIViewController<CCRequestTarget> *target;
@property (strong, nonatomic) CCHttpClient *httpClient;
@property (strong, nonatomic) CCCar *car;

+ (CCCarRequest *)buildWithRequestTarget:(UIViewController<CCRequestTarget> *)target;
- (void)refresh;

@end
