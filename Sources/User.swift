import Foundation
import ObjectMapper

public struct User : Mappable {

  public var login: String!
  public var id: Int!
  public var avatarUrl: String?
  public var gravatarId: String?
  public var url: String!
  public var receivedEventsUrl: String!
  public var type: String!

  public init?(map: Map) { }

  // Mappable
  public mutating func mapping(map: Map) {
    login             <- map["login"]
    id                <- map["id"]
    avatarUrl         <- map["avatar_url"]
    gravatarId        <- map["gravatar_id"]
    url               <- map["url"]
    receivedEventsUrl <- map["received_events_url"]
    type              <- map["type"]
  }
}
