# [Demo] Multi-platform Swift Package with platform-specific dependency

![swift 5.4](https://img.shields.io/badge/swift-5.4-orange.svg)
![platform iOS & tvOS](https://img.shields.io/badge/platform-iOS%20%7C%20tvOS-blue)

This branch contains a workaround for Swift Package Manager issue, described on the main branch and in the [Swift Forums thread](https://forums.swift.org/t/adding-platform-specific-dependency-to-multi-platform-swift-package/49645).

## Project structure

`Demo.xcworkspace` contains a Swift Package with library products and an Xcode project with **iOS** and **tvOS** app targets.

```
Demo (Xcode Workspace)
 ├─ Demo (Swift Package)
 |   ├─ AppFeature (Swift Library)
 |   ├─ Analytics-iOS (Swift Library)
 |   └─ Analytics-tvOS (Swift Library)
 └─ DemoApp (Xcode Project)
     ├─ DemoApp-iOS (iOS application)
     └─ DemoApp-tvOS (tvOS application)
```

## Description

The Swift Package supports both **iOS** and **tvOS** platforms (see [Package.swift](Package.swift) for details).

`AppFeature` target depends on an "abstract" `Analytics` target, which defines a common, platform-independent interface for analytics. There are two platform-specific libraries that implement this interface - `Analytics-iOS` and `Analytics-tvOS`. The first one depends on `FirebaseAnalytics` and the second contains an empty implementation.

`FirebaseAnalytics` is used here as an example of a dependency that only supports a single platform - **iOS** in this case.

Thanks to dependency inversion (making the `AppFeature` depends on abstract `Analytics` target and not concrete implementation target) it's possible to build the app for **iOS** and **tvOS** platform.
