import XCTest
@testable import ProviderGithub

class MockGitHub: ProviderGithub {
  var responseJson = ""
  override func processRequest(url: String, params: [String: String]?, response: @escaping (_ json: String) -> Void ) {
    response(responseJson)
  }
}

class ProviderGithubTests: XCTestCase {
    func testServerIP() {
        XCTAssertEqual(ProviderGithub().serverURL, "https://api.github.com")
    }

    func testGetTrands() {
        let provider = MockGitHub()
        provider.responseJson = "{\"total_count\": 40,\"incomplete_results\": false,\"items\":" +
        "[{\"id\": 3081286,\"name\":\"Tetris\",\"full_name\":\"Tetris\",\"owner\": " +
        "{\"login\":\"dtrupenn\",\"id\": 872147,\"avatar_url\":\"avatar_url\"," +
        "\"gravatar_id\":\"\",\"url\":\"url\",\"received_events_url\":\"url\"," +
        "\"type\":\"User\"},\"private\": false,\"html_url\":\"url\"," +
        "\"description\":\"A C implementation of Tetris using Pennsim through LC4\"," +
        "\"fork\": false,\"url\":\"url\",\"created_at\":\"2012-01-01T00:31:50Z\"," +
        "\"updated_at\":\"2013-01-05T17:58:47Z\",\"pushed_at\":\"2012-01-01T00:37:02Z\"," +
        "\"homepage\":\"\",\"size\": 524,\"stargazers_count\": 1,\"watchers_count\": 1," +
        "\"language\":\"Assembly\",\"forks_count\": 0,\"open_issues_count\": 0," +
        "\"master_branch\":\"master\",\"default_branch\":\"master\",\"score\": 10.309712}]}"
        provider.getTrands() { repos in
          XCTAssertEqual(repos.first?.name, "Tetris")
        }
    }



    static var allTests = [
        ("testServerIP", testServerIP),
        ("testGetTrands", testGetTrands)
    ]
}
