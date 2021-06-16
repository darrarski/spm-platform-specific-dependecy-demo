import Analytics
import Analytics_tvOS
import AppFeature
import SwiftUI

@main
struct App: SwiftUI.App {
  init() {
    analytics.configure()
  }

  let analytics: AnalyticsService = .tvOS

  var body: some Scene {
    WindowGroup {
      AppView(analytics: analytics)
    }
  }
}
