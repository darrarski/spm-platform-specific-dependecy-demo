import Analytics
import Firebase
import FirebaseAnalytics

public extension AnalyticsService {
  static let iOS = Self(
    configure: Firebase.FirebaseApp.configure,
    logEvent: FirebaseAnalytics.Analytics.logEvent(_:parameters:)
  )
}
