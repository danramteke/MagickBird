# MagickBird

MagickWand library for Swift. 

Note if building for `arm64` (aka the new M1 chip), add `--arch arm64` to the end of `swift build` or `swift run`


## Getting Started

Use `MagickBirdContext`, which will open a `MagickWandGenesis` and close `MagickWandTerminus` around your code:

```
MagickBirdContext {
  Tiler(inputPath: "./output/kitten.jpg", outputPath: "./output/").tile(levels: (10...13))
}
```

## Similar Projects / Inspiration

1. https://github.com/naithar/MagickWand - uses ImageMagick 6
2. https://mikemikina.com/blog/watermarking-photos-with-imagemagick-vapor-3-and-swift-on-macos-and-linux/ - how to setup the library linking
3. https://github.com/novi/SwiftMagickWand - super simple
