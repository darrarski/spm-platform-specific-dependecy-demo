import Analytics
import Analytics_iOS
import AppFeature
import SwiftUI

@main
struct App: SwiftUI.App {
  init() {
    // Uncomment this line after adding `GoogleService-Info.plist`:
    // analytics.configure()
  }

  let analytics: AnalyticsService = .iOS

  var body: some Scene {
    WindowGroup {
      AppView(analytics: analytics)
    }
  }
}
