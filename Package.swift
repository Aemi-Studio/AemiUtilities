// swift-tools-version: 6.3
import PackageDescription

let package = Package(
  name: "AemiUtilities",
  platforms: [
    .iOS(.v18), .macOS(.v15), .tvOS(.v18), .watchOS(.v11), .visionOS(.v2),
  ],
  products: [
    .library(name: "AemiUtilities", targets: ["AemiUtilities"])
  ],
  dependencies: [
    .package(url: "https://github.com/Aemi-Studio/aemi.git", revision: "f438182da40a731d5d75a7e22c4f684547401b13")
  ],
  targets: [
    .target(
      name: "AemiUtilities",
      dependencies: [
        .product(name: "AemiCore", package: "aemi"),
        .product(name: "AemiUI", package: "aemi"),
      ]
    ),
    .testTarget(
      name: "CompatibilityTests",
      dependencies: ["AemiUtilities"],
    ),
  ],
  swiftLanguageModes: [.v6]
)
