import Foundation

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
