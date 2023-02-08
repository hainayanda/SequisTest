// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonUtilities",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CommonUtilities",
            targets: ["CommonUtilities"]
        ),
        .library(
            name: "CommonTestUtilities",
            targets: ["CommonTestUtilities"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/hainayanda/Impose.git", .upToNextMajor(from: "3.1.4")),
        // MARK: Test Dependencies
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "6.1.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "11.2.1")),
        .package(url: "https://github.com/vadymmarkov/Fakery.git", .upToNextMajor(from: "5.1.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CommonUtilities",
            dependencies: ["Impose"]),
        .target(
            name: "CommonTestUtilities",
            dependencies: ["CommonUtilities", "Quick", "Nimble", "Fakery"],
            path: "TestUtilities/CommonTestUtilities"),
        .testTarget(
            name: "CommonUtilitiesTests",
            dependencies: ["CommonUtilities", "CommonTestUtilities"]),
    ]
)
