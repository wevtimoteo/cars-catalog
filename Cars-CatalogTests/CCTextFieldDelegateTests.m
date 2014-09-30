//
//  CCTextFieldDelegateTests.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/30/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CCTextFieldDelegate.h"

@interface CCTextFieldDelegateTests : XCTestCase

@end

@implementation CCTextFieldDelegateTests
{
    CCTextFieldDelegate *delegate;
    UITextField *textField;
}

- (void)setUp {
    [super setUp];
    delegate = [[CCTextFieldDelegate alloc] init];
    textField = [[UITextField alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAcceptsInsertionOfSingleCharAtEmptyText
{
    textField.text = @"";
    XCTAssertTrue([delegate textField:textField shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@"!"]);
}

- (void)testAcceptsInsertionOfSingleCharAtEndOfText
{
    textField.text = @"Lorem ipsum dolor sit amet";
    XCTAssertTrue([delegate textField:textField shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@"!"]);
}

- (void)testAcceptsInsertionOfSingleCharInMiddleOfText
{
    textField.text = @"Lorem ipsum dolor sit amet";
    XCTAssertTrue([delegate textField:textField shouldChangeCharactersInRange:NSMakeRange(5, 0) replacementString:@"!"]);
}

- (void)testRejectsInsertionOfSingleCharAtEndOfFullText
{
    textField.text = [@"" stringByPaddingToLength:170 withString:@"." startingAtIndex:0];
    XCTAssertFalse([delegate textField:textField shouldChangeCharactersInRange:NSMakeRange(170, 0) replacementString:@"!"]);
}

- (void)testRejectsInsertionOfSingleCharAtMiddleOfFullText
{
    textField.text = [@"" stringByPaddingToLength:170 withString:@"." startingAtIndex:0];
    XCTAssertFalse([delegate textField:textField shouldChangeCharactersInRange:NSMakeRange(5, 0) replacementString:@"!"]);
}

- (void)testAcceptsRemovalOfCharInText
{
    textField.text = @"Lorem ipsum dolor sit amet";
    XCTAssertTrue([delegate textField:textField shouldChangeCharactersInRange:NSMakeRange(4, 1) replacementString:@""]);
}

- (void)testAcceptsPastingWithinTextBounds
{
    textField.text = @"Lorem ipsum dolor sit amet";
    XCTAssertTrue([delegate textField:textField shouldChangeCharactersInRange:NSMakeRange(10, 0) replacementString:@"!!!!!"]);
}

- (void)testRejectsPastingBeyondTextBounds
{
    textField.text = [@"" stringByPaddingToLength:165 withString:@"." startingAtIndex:0];
    XCTAssertFalse([delegate textField:textField shouldChangeCharactersInRange:NSMakeRange(165, 0) replacementString:@"!!!!!!!!!!"]);

}

@end
