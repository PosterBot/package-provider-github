import Foundation
import ObjectMapper

public struct Results<T: Mappable> : Mappable {

  public var totalCount: Int!
  public var incompleteResults: Bool!
  public var items: [T]!

  public init?(map: Map) { }

  // Mappable
  public mutating func mapping(map: Map) {
    totalCount        <- map["total_count"]
    incompleteResults <- map["incomplete_results"]
    items             <- map["items"]
  }
}
