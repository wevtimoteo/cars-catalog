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
#import "CCCarFormViewController.h"

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

- (void)testShowsResultsReturnedByTheAPI
{
    NSInteger results = 30;
    [[[carsRequest stub] andReturnValue:OCMOCK_VALUE(results)] count];
    
    XCTAssertEqual(results, [carsScreen tableView:nil numberOfRowsInSection:0]);
}

- (void)testPushesToAddCarScreenOnClick
{
    id navigationController = [OCMockObject niceMockForClass:[UINavigationController class]];
    [[navigationController expect] pushViewController:[OCMArg checkWithBlock:^BOOL(CCCarFormViewController *viewController) {
        return YES;
    }] animated:YES];
    
    carsScreen = [OCMockObject partialMockForObject:carsScreen];
    [[[(id)carsScreen stub] andReturn:navigationController] navigationController];

    [carsScreen performSelector:@selector(goToAddCar) withObject:nil];

    [navigationController verify];
    [(id)carsScreen stopMocking];
}

@end
