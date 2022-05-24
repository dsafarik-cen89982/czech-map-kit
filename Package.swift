// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CzechMapKit",
	platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "CzechMapKit",
            targets: ["CzechMapKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MaxDesiatov/XMLCoder.git", from: "0.13.1"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "CzechMapKit",
            dependencies: [
                .product(name: "XMLCoder", package: "XMLCoder"),
                .product(name: "Logging", package: "swift-log")
                ]),
        .testTarget(
            name: "CzechMapKitTests",
            dependencies: ["CzechMapKit"]),
    ]
)
