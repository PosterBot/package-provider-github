import Foundation
import ObjectMapper

struct Results<T: Mappable> : Mappable {

  var totalCount: Int!
  var incompleteResults: Bool!
  var items: [T]!

  init?(map: Map) { }

  // Mappable
  mutating func mapping(map: Map) {
    totalCount        <- map["total_count"]
    incompleteResults <- map["incomplete_results"]
    items             <- map["items"]
  }
}
