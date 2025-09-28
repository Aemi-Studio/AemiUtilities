// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AemiUtilities",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "AemiUtilities",
            targets: ["AemiUtilities"]
        ),
    ],
    targets: [.target(name: "AemiUtilities")],
    swiftLanguageModes: [.version("6.2")]
)
