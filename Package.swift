// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Relay",
    products: [
        .library(name: "Relay",targets: ["Relay"]),
    ],
    targets: [
        .target(name: "Relay",dependencies: []),
    ]
)
