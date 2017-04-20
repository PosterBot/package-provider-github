import XCTest
@testable import ProviderGithub

class StringTests: XCTestCase {

    func testURLBuilder() {
      let url = "https://some.url".toURL(withParams: ["param1":"test1", "param2":"test2"])
      XCTAssertNotNil(url)
      XCTAssertEqual(url!.absoluteString, "https://some.url?param1=test1&param2=test2")
    }


    static var allTests = [
        ("testURLBuilder", testURLBuilder),
    ]
}
