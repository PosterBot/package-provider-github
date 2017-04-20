import Foundation

class ProviderGithub {

  typealias responseClosure = ((_ json: String) -> Void)
  let serverURL = "https://api.github.com"

  func processRequest(url: String, params: [String: String]? = nil, response: responseClosure) {
    response("")
  }

  func search(q: String? = nil, sort: SortType?, order: OrderType?, _ response: responseClosure) {

  }

  func getTrands(_ response: responseClosure) {
    processRequest(url:serverURL+"/some/path/", response: response)
  }
}

enum SortType: String {
  case stars = "stars"
  case forks = "forks"
  case updated = "updated"
}

enum OrderType: String {
  case asc = "asc"
  case desc = "desc"
}

extension Date {
  var lastWeek:String {
    get {
      let formatter = DateFormatter()
      formatter.dateFormat = "YYYY-MM-dd"

      let lastWeekTime: TimeInterval = self.timeIntervalSince1970 - TimeInterval(7 * 24*60*60)
      return formatter.string(from: Date(timeIntervalSince1970: lastWeekTime) )
    }
  }
}

extension String {
  func toURL(withParams parameters:[String:String]) -> URL? {
    guard var components = URLComponents(string: self) else { return nil }
    var items = [URLQueryItem]()
    for (key, value) in parameters {
        items.append(URLQueryItem(name: key, value: value))
    }
    components.queryItems = items
    return components.url
  }
}
