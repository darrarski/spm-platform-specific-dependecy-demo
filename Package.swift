// swift-tools-version:5.4

import PackageDescription

let package = Package(
  name: "Demo",
  platforms: [
    .iOS(.v14),
    .tvOS(.v14),
  ],
  products: [
    .library(name: "AppFeature", targets: ["AppFeature"]),
    .library(name: "Analytics-iOS", targets: ["Analytics-iOS"]),
    .library(name: "Analytics-tvOS", targets: ["Analytics-tvOS"]),
  ],
  dependencies: [
    .package(
      name: "Firebase",
      url: "https://github.com/firebase/firebase-ios-sdk.git",
      .exact("8.1.1")
    ),
  ],
  targets: [
    .target(
      name: "AppFeature",
      dependencies: [
        .target(name: "Analytics"),
      ]
    ),
    .testTarget(
      name: "AppFeatureTests",
      dependencies: [
        .target(name: "AppFeature"),
      ]
    ),
    .target(
      name: "Analytics"
    ),
    .target(
      name: "Analytics-iOS",
      dependencies: [
        .target(name: "Analytics"),
        .product(
          name: "FirebaseAnalytics",
          package: "Firebase"
        ),
      ]
    ),
    .target(
      name: "Analytics-tvOS",
      dependencies: [
        .target(name: "Analytics"),
      ]
    ),
  ]
)
