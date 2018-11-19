// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "HelloClutter",
    products: [
        .executable(
            name: "HelloClutter",
            targets: ["HelloClutter"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/rpinz/SwiftClutter",
            .branch("master"))
    ],
    targets: [
        .target(
            name: "HelloClutter",
            dependencies: ["Clutter"],
            path: "Sources")
    ],
    swiftLanguageVersions: [4]
)
