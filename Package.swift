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
    .package(url: "https://github.com/Aemi-Studio/aemi.git", revision: "bd5e4cf4441ca3ed1b424935142586ccaac0f835")
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
