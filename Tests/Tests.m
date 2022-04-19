@import LoginServiceKit;
@import XCTest;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp {
    [LoginServiceKit removeLoginItem];
}

- (void)tearDown {
    [LoginServiceKit removeLoginItem];
}

- (void)testLoginItems {
    XCTAssertFalse(LoginServiceKit.loginItemExists);
    [LoginServiceKit addLoginItem];
    XCTAssertTrue(LoginServiceKit.loginItemExists);
    [LoginServiceKit removeLoginItem];
    XCTAssertFalse(LoginServiceKit.loginItemExists);
}

@end
