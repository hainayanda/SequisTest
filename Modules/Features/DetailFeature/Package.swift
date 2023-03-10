// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DetailFeature",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DetailFeature",
            targets: ["DetailFeature"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "SharedFeatureDependencies", path: "../Common/SharedFeatureDependencies"),
        .package(name: "CommonUI", path: "../Common/CommonUI"),
        .package(name: "CommonUtilities", path: "../Common/CommonUtilities"),
        .package(name: "CommonNetworking", path: "../Common/CommonNetworking")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DetailFeature",
            dependencies: ["CommonUI", "CommonUtilities", "CommonNetworking", "SharedFeatureDependencies"]),
        .testTarget(
            name: "DetailFeatureTests",
            dependencies: [
                "DetailFeature",
                .product(name: "CommonTestUtilities", package: "CommonUtilities"),
                .product(name: "CommonNetworkingMock", package: "CommonNetworking")
            ]
        )
    ]
)
