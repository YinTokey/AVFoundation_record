//
//  MainVTests.m
//  KIFTeUITests
//
//  Created by YinjianChen on 2019/8/29.
//  Copyright © 2019 YinTokey. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KIF/KIF.h>

@interface MainVTests : KIFTestCase

@end

@implementation MainVTests

- (void)beforeEach
{
    [[viewTester usingLabel:@"red_btn"] tap];

}

- (void)afterEach
{
    [tester tapViewWithAccessibilityLabel:@"red_btn" traits:UIAccessibilityTraitButton];
}



//- (void)testOne{
//    [tester tapViewWithAccessibilityLabel:@"red_btn"];
//}

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *redBtnButton = app.buttons[@"red_btn"];
    [redBtnButton tap];
    [redBtnButton tap];
    [redBtnButton tap];
    
    XCUIElement *redBtnElement = [app.otherElements containingType:XCUIElementTypeButton identifier:@"red_btn"].element;
    [redBtnElement tap];
    [redBtnElement tap];
    [redBtnButton tap];

}

@end
