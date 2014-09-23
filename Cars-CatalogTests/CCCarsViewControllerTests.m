//
//  CCCarsViewControllerTests.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/22/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "CCCarsViewController.h"
#import "CCCarsRequest.h"

@interface CCCarsViewControllerTests : XCTestCase

@end

@implementation CCCarsViewControllerTests
{
    CCCarsViewController *carsScreen;
    id carsRequest;
}

- (void)setUp
{
    [super setUp];
    carsRequest = OCMClassMock([CCCarsRequest class]);
    
    carsScreen = [[CCCarsViewController alloc] init];
    [carsScreen view];
    carsScreen.carsRequest = carsRequest;
}

- (void)tearDown
{
    carsScreen = nil;
    [carsRequest verify];
    [super tearDown];
}

- (void)testRefreshesDataOnViewLoad
{
    [[carsRequest expect] refresh];
    [carsScreen viewWillAppear:NO];
}

- (void)testReloadsTableDataOnRequestRefresh
{
    id tableView = [OCMockObject niceMockForClass:[UITableView class]];
    [[tableView expect] reloadData];
    carsScreen.tableView = tableView;
    
    [carsScreen dataRefreshed:CCResponseSuccess];
    [tableView verify];
}

@end
