import Foundation
import ObjectMapper

struct Repository : Mappable {
  var id: Int!
  var name: String!
  var fullName: String!
  var owner: User!
  var isPrivate : Bool!
  var htmlUrl: String!
  var description: String!
  var isFork: Bool!
  var url: String!
  var createdAt: Date?
  var updatedAt: Date?
  var pushedAt: Date?
  var homapage: String!
  var size: Int!
  var stargazersCount: Int!
  var watchersCount: Int!
  var language: String!
  var forksCount: Int!
  var openIssuesCount: Int!
  var masterBranch: String!
  var defaultBranch: String!
  var score: Float!

  init?(map: Map) { }

  // Mappable
  mutating func mapping(map: Map) {
    id              <- map["id"]
    name            <- map["name"]
    fullName        <- map["full_name"]
    owner           <- map["owner"]
    isPrivate       <- map["private"]
    htmlUrl         <- map["html_url"]
    description     <- map["description"]
    isFork          <- map["fork"]
    url             <- map["url"]
    createdAt       <- (map["created_at"], ISO8601DateTransform())
    updatedAt       <- (map["updated_at"], ISO8601DateTransform())
    pushedAt        <- (map["pushed_at"],  ISO8601DateTransform())
    homapage        <- map["homepage"]
    size            <- map["size"]
    stargazersCount <- map["stargazers_count"]
    watchersCount   <- map["watchers_count"]
    language        <- map["language"]
    forksCount      <- map["forks_count"]
    openIssuesCount <- map["open_issues_count"]
    masterBranch    <- map["master_branch"]
    defaultBranch   <- map["default_branch"]
    score           <- map["score"]
  }
}
