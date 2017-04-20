import Foundation

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
