public struct AnalyticsService {
  public init(
    configure: @escaping () -> Void,
    logEvent: @escaping (String, [String: Any]?) -> Void
  ) {
    self.configure = configure
    self.logEvent = logEvent
  }

  public var configure: () -> Void
  public var logEvent: (String, [String: Any]?) -> Void
}
