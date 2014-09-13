//
//  CCCarTests.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/12/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CCCar.h"

@interface CCCarTests : XCTestCase

@end

@implementation CCCarTests
{
    NSDictionary * data;
}

- (void)setUp
{
    [super setUp];
    data = @{
        @"Ano": @"2011",
        @"Fabricante": @"GM",
        @"Nome": @"Corsa",
        @"Quilometragem": @31323,
        @"createdAt": @"2014-09-05T22:06:54.395Z",
        @"updatedAt": @"2014-09-05T22:07:08.729Z",
        @"objectId": @"pfztoKBGAj"
    };
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInitializesFromDictionary
{
    CCCar *car = [[CCCar alloc] initFromDictionary:data];

    XCTAssert(2011 == car.year);
    XCTAssertEqualObjects(@"GM", car.manufacturer);
    XCTAssertEqualObjects(@"Corsa", car.modelName);
    XCTAssert(31323 == car.traveledKilometers);
    XCTAssertEqualObjects(@"GM", car.manufacturer);
    XCTAssertEqualObjects(@"pfztoKBGAj", car.objectId);
    XCTAssert([@"2014-09-05 22:06:54 +0000" isEqual:[car.createdAt description]]);
    XCTAssert([@"2014-09-05 22:07:08 +0000" isEqual:[car.updatedAt description]]);
}

@end
