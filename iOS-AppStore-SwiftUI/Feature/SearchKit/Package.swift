// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SearchKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "SearchKit",
            targets: ["SearchKit"]
        ),
    ],
    dependencies: [
        .package(path: "./AppDetailKit"),
        .package(path: "./NetworkKit"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture/", .upToNextMajor(from: "1.12.1"))
    ],
    targets: [
        .target(
            name: "SearchKit",
            dependencies: [
                .product(name: "AppDetailKit", package: "AppDetailKit"),
                .product(name: "NetworkKit", package: "NetworkKit"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "SearchKitTests",
            dependencies: ["SearchKit"]
        ),
    ]
)
