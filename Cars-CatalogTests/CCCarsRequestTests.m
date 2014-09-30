//
//  CCCarsRequestTests.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/22/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "CCCarsRequest.h"

@interface CCCarsRequestTests : XCTestCase

@end

@implementation CCCarsRequestTests
{
    CCCarsRequest *carsRequest;
    NSDictionary *data;
    id httpClient;
    id target;
}

- (void)setUp
{
    [super setUp];
    httpClient = OCMClassMock([CCHttpClient class]);
    target = OCMProtocolMock(@protocol(CCRequestTarget));
    data = @{
        @"results": @[
            @{
                @"Ano": @"2011",
                @"Fabricante": @"GM",
                @"Nome": @"Corsa",
                @"Quilometragem": @31323,
                @"createdAt": @"2014-09-05T22:06:54.395Z",
                @"updatedAt": @"2014-09-05T22:07:08.729Z",
                @"objectId": @"pfztoKBGAj"
            },
            @{
                @"Ano": @"2013",
                @"Fabricante": @"Nissan",
                @"Nome": @"Livina",
                @"Quilometragem": @1000,
                @"createdAt": @"2013-09-05T22:06:54.395Z",
                @"updatedAt": @"2013-10-05T22:07:08.729Z",
                @"objectId": @"BxAtoOkGlY"
            }
        ]
    };
    
    carsRequest = [CCCarsRequest buildWithRequestTarget:target];
    carsRequest.httpClient = httpClient;
}

- (void)tearDown
{
    carsRequest = nil;
    [httpClient verify];
    [target verify];
    [super tearDown];
}

- (void)testRetrievesDataFromAPI
{
    [self setupSuccessfulRequest];
    [[target stub] dataRefreshed:CCResponseSuccess];
    
    [carsRequest refresh];
    
    XCTAssertEqualObjects(@"Corsa", [carsRequest atIndex:0].modelName);
    XCTAssertEqualObjects(@"Livina", [carsRequest atIndex:1].modelName);
    XCTAssert([carsRequest count] == 2);
}

- (void)testNotifiesTargetOfSuccessfulRefreshEvent
{
    [self setupSuccessfulRequest];
    
    [[target expect] dataRefreshed:CCResponseSuccess];
    
    [carsRequest refresh];
}

#pragma mark - Helper methods

- (void)setupSuccessfulRequest
{
    OCMStub([httpClient  get:OCMOCK_ANY
    success:[OCMArg checkWithBlock:^BOOL(id callback) {
        ((void(^)(AFHTTPRequestOperation *, id)) callback)(nil, data);
        return YES;
    }]
    failure:OCMOCK_ANY]);
}

- (void)setupFailedRequest:(NSInteger)statusCode
{
    id operation = OCMClassMock([AFHTTPRequestOperation class]);
    id response = OCMClassMock([NSHTTPURLResponse class]);
    [[[response stub] andReturnValue:OCMOCK_VALUE(statusCode)] statusCode];
    [[[operation stub] andReturnValue:response] response];

    OCMStub([httpClient get:OCMOCK_ANY
    success: OCMOCK_ANY
    failure:[OCMArg checkWithBlock:^BOOL(id callback) {
        ((void(^)(void *, id)) callback)(nil, nil);
        return YES;
    }]]);
}

@end
