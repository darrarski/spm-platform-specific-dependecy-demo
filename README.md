# Demo: Multiplatform Swift Package with platform-specific dependency

![swift 5.4](https://img.shields.io/badge/swift-5.4-orange.svg)
![platform iOS & tvOS](https://img.shields.io/badge/platform-iOS%20%7C%20tvOS-blue)

This project contains Swift Package that supports both **iOS** and **tvOS** platforms (see [Package.swift](Package.swift) for details).

There is a single library product built from a single target. This target depends on `FirebaseAnalytics`. 

`FirebaseAnalytics` is used here as an example of dependency that only supports a single platform - **iOS** in this case.

Despite adding `condition` parameter to the target's dependecy:

```swift
.target(
  name: "Demo",
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
