// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Nuke", .upToNextMajor(from: "12.5.0")),
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                .product(name: "NukeUI", package: "Nuke"),
                .product(name: "NukeExtensions", package: "Nuke"),
            ]
        ),
    ]
)
