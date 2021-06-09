// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MagickBird",
    platforms: [
      .macOS(.v11),
    ],
    products: [
        .library(name: "MagickBird", targets: ["MagickBird"])
    ],
    dependencies: [

    ],
    targets: [

        .target(name: "MagickBirdSample", dependencies: ["MagickBird"]),
        .target(name: "MagickBird", dependencies: ["MagickWand"]),
        .systemLibrary(name: "MagickWand", pkgConfig: "MagickWand"),
    ]

)
