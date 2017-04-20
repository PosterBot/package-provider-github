import XCTest
@testable import ProviderGithub

class MockGitHub: ProviderGithub {
  var responseJson = ""
  override func processRequest(url: String, params: [String: String]?, response: (_ json: String) -> Void ) {
    response(responseJson)
  }
}

class ProviderGithubTests: XCTestCase {
    func testServerIP() {
        XCTAssertEqual(ProviderGithub().serverURL, "https://api.github.com")
    }

    func testGetTrands() {
        let provider = MockGitHub()
        provider.responseJson = "Hello"
        provider.getTrands() { result in
          XCTAssertEqual(result, "Hello")
        }
    }

    static var allTests = [
        ("testServerIP", testServerIP),
        ("testGetTrands", testGetTrands)
    ]
}
