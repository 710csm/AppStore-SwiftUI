// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "NetworkKit",
            targets: ["NetworkKit"]
        ),
    ],
    dependencies: [
        .package(path: "./Utils"),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
    ],
    targets: [
        .target(
            name: "NetworkKit",
            dependencies: [
                .product(name: "Utils", package: "Utils"),
                .product(name: "Moya", package: "Moya"),
            ]
        ),
        .testTarget(
            name: "NetworkKitTests",
            dependencies: [
                "NetworkKit",
            ]
        ),
    ]
)
