import XCTest
@testable import ProviderGithub

class DateTests: XCTestCase {

    func testLastWeek() {
      var date = Date(timeIntervalSince1970: 1492376054)
      XCTAssertEqual(date.lastWeek, "2017-04-09")

      date = Date(timeIntervalSince1970: 1486684800)
      XCTAssertEqual(date.lastWeek, "2017-02-03")
    }


    static var allTests = [
        ("testLastWeek", testLastWeek),
    ]
}
