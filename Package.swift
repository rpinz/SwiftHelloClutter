import PackageDescription

let package = Package(
    name: "HelloClutter",
    dependencies: [
        .Package(url: "https://github.com/rhx/SwiftClutter.git", majorVersion: 2)
    ]
)
