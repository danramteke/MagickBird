import MagickBird
import Foundation

MagickBirdContext {
  Tiler(
    inputPath: "./output/kitten.jpg", 
    outputPath: "./output/jpg/", 
    outputFileExtension: "jpg") 
    .tile(levels: (10...13))

  Tiler(
    inputPath: "./output/kitten.jpg", 
    outputPath: "./output/png/", 
    outputFileExtension: "png")
    .tile(levels: (10...13))
}
