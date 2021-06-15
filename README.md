# [Demo] Multi-platform Swift Package with platform-specific dependency

![swift 5.4](https://img.shields.io/badge/swift-5.4-orange.svg)
![platform iOS & tvOS](https://img.shields.io/badge/platform-iOS%20%7C%20tvOS-blue)

This is an example project for [Swift Forums thread](https://forums.swift.org/t/adding-platform-specific-dependency-to-multi-platform-swift-package/49645).

## Project structure

`Demo.xcworkspace` contains a Swift Package with library products and an Xcode project with **iOS** and **tvOS** app targets.

```
Demo (Xcode Workspace)
 ├─ Demo (Swift Package)
 |   └─ AppFeature (Swift Library)
 └─ DemoApp (Xcode Project)
     ├─ DemoApp-iOS (iOS application)
     └─ DemoApp-tvOS (tvOS application)
```

## Description

The Swift Package supports both **iOS** and **tvOS** platforms (see [Package.swift](Package.swift) for details).

`AppFeature` library product (built from `AppFeature` target) depends on `FirebaseAnalytics`. 

`FirebaseAnalytics` is used here as an example of a dependency that only supports a single platform - **iOS** in this case.

Despite adding `condition` parameter to the target's dependecy:

```swift
.target(
  name: "AppFeature",
  dependencies: [
    .product(
      name: "FirebaseAnalytics",
      package: "Firebase",
      condition: .when(platforms: [.iOS])
    ),
  ]
),
```

The library product can't be built for **tvOS** platform, due to an error:

> [...]/FirebaseAnalytics.xcframework:1:1: While building for tvOS Simulator, no library for this platform was found in '[...]/FirebaseAnalytics.xcframework'.

The library builds without any issue for **iOS** platform.
