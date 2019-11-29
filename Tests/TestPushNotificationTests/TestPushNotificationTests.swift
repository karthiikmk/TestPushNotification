import XCTest
@testable import TestPushNotification

final class TestPushNotificationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TestPushNotification().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
