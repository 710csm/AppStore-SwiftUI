// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppDetailKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "AppDetailKit",
            targets: ["AppDetailKit"]
        ),
    ],
    dependencies: [
        .package(path: "./DesignSystem"),
        .package(path: "./Utils"),
    ],
    targets: [
        .target(
            name: "AppDetailKit",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "Utils", package: "Utils"),
            ]
        ),
        .testTarget(
            name: "AppDetailKitTests",
            dependencies: ["AppDetailKit"]
        ),
    ]
)
