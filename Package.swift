// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ComposableKeychain",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15),
        .tvOS(.v15),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "ComposableKeychain",
            targets: [
                "ComposableKeychain"
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "0.9.0"
        ),
        .package(
            url: "https://github.com/kishikawakatsumi/KeychainAccess",
            from: "4.2.2"
        ),
    ],
    targets: [
        .target(
            name: "ComposableKeychain",
            dependencies: [
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                ),
                "KeychainAccess",
            ]
        ),
        .testTarget(
            name: "ComposableKeychainTests",
            dependencies: [
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                ),
                "KeychainAccess",
                "ComposableKeychain",
            ]
        ),
    ]
)
