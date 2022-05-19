// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CadastreMapKit",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CadastreMapKit",
            targets: ["CadastreMapKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MaxDesiatov/XMLCoder.git", from: "0.13.1"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CadastreMapKit",
            dependencies: [
                .product(name: "XMLCoder", package: "XMLCoder"),
                .product(name: "Logging", package: "swift-log")
                ]),
        .testTarget(
            name: "CadastreMapKitTests",
            dependencies: ["CadastreMapKit"]),
    ]
)
