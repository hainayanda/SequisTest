// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonUI",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CommonUI",
            targets: ["CommonUI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
            .package(name: "CommonUtilities", path: "../CommonUtilities"),
            .package(url: "https://github.com/lorenzofiamingo/swiftui-cached-async-image", .upToNextMajor(from: "2.1.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CommonUI",
            dependencies: [
                "CommonUtilities",
                .product(name: "CachedAsyncImage", package: "swiftui-cached-async-image")
            ]
        ),
        .testTarget(
            name: "CommonUITests",
            dependencies: [
                "CommonUI",
                .product(name: "CommonTestUtilities", package: "CommonUtilities")
            ]
        )
    ]
)
