import Foundation
import ObjectMapper

struct User : Mappable {

  var login: String!
  var id: Int!
  var avatarUrl: String?
  var gravatarId: String?
  var url: String!
  var receivedEventsUrl: String!
  var type: String!

  init?(map: Map) { }

  // Mappable
  mutating func mapping(map: Map) {
    login             <- map["login"]
    id                <- map["id"]
    avatarUrl         <- map["avatar_url"]
    gravatarId        <- map["gravatar_id"]
    url               <- map["url"]
    receivedEventsUrl <- map["received_events_url"]
    type              <- map["type"]
  }
}
