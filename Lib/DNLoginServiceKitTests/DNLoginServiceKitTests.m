#import "DNLoginServiceKit.h"

#import "DNLoginServiceKitTests.h"

@implementation DNLoginServiceKitTests

- (void)setUp {
    [DNLoginServiceKit removeLoginItem];
}

- (void)tearDown {
    [DNLoginServiceKit removeLoginItem];
}

- (void)testLoginItems {
    XCTAssertFalse([DNLoginServiceKit loginItemExists]);
    [DNLoginServiceKit addLoginItem];
    XCTAssertTrue([DNLoginServiceKit loginItemExists]);
    [DNLoginServiceKit removeLoginItem];
    XCTAssertFalse([DNLoginServiceKit loginItemExists]);
}

@end
