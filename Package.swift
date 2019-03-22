// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MagickBird",
    dependencies: [

    ],
    targets: [

        .target(name: "MagickBird", dependencies: ["MagickWand", "Tiler"]),
        .target(name: "Tiler", dependencies: ["MagickWand"]),
        .systemLibrary(name: "MagickWand"),

        .testTarget(
            name: "MagickBirdTests",
            dependencies: ["MagickBird"]),
    ]
)
