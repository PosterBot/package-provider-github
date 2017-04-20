import Foundation
import ObjectMapper

public struct Repository : Mappable {
  public var id: Int!
  public var name: String!
  public var fullName: String!
  public var owner: User!
  public var isPrivate : Bool!
  public var htmlUrl: String!
  public var description: String!
  public var isFork: Bool!
  public var url: String!
  public var createdAt: Date?
  public var updatedAt: Date?
  public var pushedAt: Date?
  public var homapage: String!
  public var size: Int!
  public var stargazersCount: Int!
  public var watchersCount: Int!
  public var language: String!
  public var forksCount: Int!
  public var openIssuesCount: Int!
  public var masterBranch: String!
  public var defaultBranch: String!
  public var score: Float!

  public init?(map: Map) { }

  // Mappable
  public mutating func mapping(map: Map) {
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
