// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MagickBirdTilingSample",
    platforms: [
      .macOS(.v11),
    ],
    products: [
        .executable(name: "MagickBirdTilingSample", targets: ["MagickBirdTilingSample"])
    ],
    dependencies: [
        .package(name: "MagickBird", path: "../"),
    ],
    targets: [
        .executableTarget(name: "MagickBirdTilingSample", dependencies: ["MagickBird"]),
    ]
)
