import PackageDescription

let package = Package(
    name: "HelloClutter",
    dependencies: [
        .Package(url: "https://github.com/rpinz/SwiftClutter", majorVersion: 2)
    ],
    swiftLanguageVersions: [3, 4]
)
