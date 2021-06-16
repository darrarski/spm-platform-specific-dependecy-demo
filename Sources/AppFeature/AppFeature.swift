import Analytics
import SwiftUI

public struct AppView: View {
  public init(analytics: AnalyticsService) {
    self.analytics = analytics
  }

  let analytics: AnalyticsService

  public var body: some View {
    Text("Hello, world!")
      .padding()
      .onAppear {
        analytics.logEvent("AppView.onAppear", nil)
      }
  }
}
