# MagickBird

MagickWand library for Swift


## Helpful Copy/Pastes

### Build or run using Swift Package Manager

    swift build -Xlinker $(pkg-config --libs-only-L MagickWand)

### Generate Xcode project

    swift package generate-xcodeproj --xcconfig-overrides Package.xcconfig

### Get Package config info

    pkg-config --cflags-only-I MagickWand
    pkg-config --libs MagickWand
    pkg-config --cflags-only-other ImageMagick


## Similar Projects / Inspiration

1. https://github.com/naithar/MagickWand - uses ImageMagick 6
2. https://mikemikina.com/blog/watermarking-photos-with-imagemagick-vapor-3-and-swift-on-macos-and-linux/ - how to setup the library linking
3. https://github.com/novi/SwiftMagickWand - super simple
