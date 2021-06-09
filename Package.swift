// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "MagickBird",
    platforms: [
      .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "MagickBird", 
            targets: ["MagickBird"])
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "MagickBird", 
            dependencies: ["MagickWand"]),
        .systemLibrary(
            name: "MagickWand", 
            pkgConfig: "MagickWand"),
        .testTarget(
            name: "MagickBirdTests", 
            dependencies: ["MagickBird"],
            resources: [
              .copy("fixtures")
            ]),
    ]
)
