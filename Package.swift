// swift-tools-version:5.4

import PackageDescription

let package = Package(
  name: "Demo",
  platforms: [
    .iOS(.v14),
    .tvOS(.v14),
  ],
  products: [
    .library(
      name: "AppFeature",
      targets: ["AppFeature"]
    ),
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
        .product(
          name: "FirebaseAnalytics",
          package: "Firebase",
          condition: .when(platforms: [.iOS])
        ),
      ]
    ),
    .testTarget(
      name: "AppFeatureTests",
      dependencies: [
        .target(name: "AppFeature"),
      ]
    ),
  ]
)
