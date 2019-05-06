// swift-tools-version:5.0
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
        .target(name: "MagickWand", 
            dependencies: [], 
            cSettings: [
                .define("MAGICKCORE_HDRI_ENABLE", to: "0"), 
                .define("MAGICKCORE_QUANTUM_DEPTH", to: "16"),
            ],
            linkerSettings: [
                .linkedLibrary("MagickWand-7.Q16HDRI"), 
                .linkedLibrary("MagickCore-7.Q16HDRI"),
            ]
        ),
        
    ]
)
