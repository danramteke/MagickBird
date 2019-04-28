# MagickBird

MagickWand library for Swift


## Helpful Copy/Pastes

### Build or run using Swift Package Manager

    swift build -Xswiftc -I/usr/local/Cellar/imagemagick/7.0.8-42/include/ImageMagick-7 -Xlinker -L/usr/local/Cellar/imagemagick/7.0.8-42/lib -Xlinker -lMagickWand-7.Q16HDRI -Xlinker -lMagickCore-7.Q16HDRI -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16
    swift  run -Xswiftc -I/usr/local/Cellar/imagemagick/7.0.8-42/include/ImageMagick-7 -Xlinker -L/usr/local/Cellar/imagemagick/7.0.8-42/lib -Xlinker -lMagickWand-7.Q16HDRI -Xlinker -lMagickCore-7.Q16HDRI -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16

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
