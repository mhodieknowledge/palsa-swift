// swift-tools-version:5.7
// Raised from 5.1 by scripts/patch-sdks.sh: linking a product per platform needs 5.7.

import PackageDescription

let package = Package(
    name: "PalsaApi",
    platforms: [
        // Raised by scripts/patch-sdks.sh from iOS 11 / macOS 10.13: Webhook.swift uses CryptoKit,
        // which does not exist before iOS 13 and macOS 10.15.
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PalsaApi",
            targets: ["PalsaApi"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Flight-School/AnyCodable", .upToNextMajor(from: "0.6.1")),
        // Added by scripts/patch-sdks.sh: CryptoKit is Apple-only, and Webhook.swift needs HMAC-SHA256
        // wherever the client runs. Linked only off Apple, in the target below.
        .package(url: "https://github.com/apple/swift-crypto", .upToNextMajor(from: "3.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "PalsaApi",
            dependencies: [
                "AnyCodable",
                .product(
                    name: "Crypto",
                    package: "swift-crypto",
                    condition: .when(platforms: [.linux])
                ),
            ],
            path: ".",
            // Added by scripts/patch-sdks.sh. This target's path is the package root, so without an
            // exclude list the test sources below are compiled into the library as well.
            exclude: [
                "Tests",
                "docs",
                "README.md",
                "PALSA.md",
                "project.yml",
                "Cartfile",
                "PalsaApi.podspec",
                "git_push.sh",
                ".openapi-generator",
                ".openapi-generator-ignore",
                ".swiftformat",
            ]
        ),
        // Added by scripts/patch-sdks.sh: the generator emits no test target, so `swift test` found
        // nothing to run and the webhook tests never executed.
        .testTarget(
            name: "PalsaApiTests",
            dependencies: ["PalsaApi"],
            path: "Tests/PalsaApiTests"
        ),
    ]
)
