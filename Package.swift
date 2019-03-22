// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MagickBird",
    products: [
        .library(name: "MagickBird", targets: ["MagickBird"])
    ],
    dependencies: [

    ],
    targets: [

        .target(name: "MagickBirdSample", dependencies: ["MagickBird"]),
        .target(name: "MagickBird", dependencies: ["MagickWand"]),
        .systemLibrary(name: "MagickWand"),
    ]
)
