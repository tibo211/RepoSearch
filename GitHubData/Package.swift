// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitHubData",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "GitHubData",
            targets: ["GitHubData"]),
    ],
    dependencies: [
        // InitMacro package to generate model initializers in compile time.
        .package(
            url: "https://github.com/LeonardoCardoso/InitMacro.git",
            branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "GitHubData",
            dependencies: ["InitMacro"]),
        .testTarget(
            name: "GitHubDataTests",
            dependencies: ["GitHubData"]),
    ]
)
