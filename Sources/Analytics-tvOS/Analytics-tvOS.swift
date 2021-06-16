import Analytics
import Foundation

public extension AnalyticsService {
  static let tvOS = Self(
    configure: {
      print("[NOT IMPLEMENTED] AnalyticsService.tvOS.configure()")
    },
    logEvent: { name, params in
      let paramsString = params.map(String.init(describing:)) ?? "nil"
      print("[NOT IMPLEMENTED] AnalyticsService.tvOS.logEvent(\(name), \(paramsString))")
    }
  )
}
