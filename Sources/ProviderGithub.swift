import Foundation

public class Github {

  typealias responseClosure = ((_ json: String) -> Void)
  let serverURL = "https://api.github.com"

  func processRequest(url: String, params: [String: String]? = nil, response: @escaping responseClosure) {
    let url = url.toURL(withParams: params ?? [:])
    URLSession.shared.dataTask(with: url!) { data, _, _ in
      if let jsonData = data, let stringJson = String(data: jsonData, encoding: .utf8) {
          response(stringJson)
      }
    }.resume()
  }

  public func search(q: String? = nil, sort: SortType?, order: OrderType?, _ response:  @escaping ((_ results:Results<Repository>) -> Void)) {
    var params = [String: String]()
    if let q = q {
      params["q"] = q
    }
    if let sort = sort {
      params["sort"] = sort.rawValue
    }
    if let order = order {
      params["order"] = order.rawValue
    }
    processRequest(url:serverURL+"/search/repositories/", params:params) { json in
      // TODO: To add error processor
      guard let result = Results<Repository>(JSONString: json) else { return }
      response(result)
    }
  }

  public func getTrands(_ response: @escaping ((_ repositories:[Repository]) -> Void) ) {
    search(q:"created:>\(Date().lastWeek)", sort: .stars, order: .desc) { results in
      response(results.items)
    }
  }
}

public enum SortType: String {
  case stars   = "stars"
  case forks   = "forks"
  case updated = "updated"
}

public enum OrderType: String {
  case asc  = "asc"
  case desc = "desc"
}
