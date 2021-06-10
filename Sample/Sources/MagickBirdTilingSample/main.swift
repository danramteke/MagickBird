import MagickBird
import Foundation

MagickBirdContext {
  Tiler(
    inputPath: "./output/india.png", 
    outputPath: "./output/jpg/", 
    outputFileExtension: "jpg") 
    .tile(levels: (6...10))

  Tiler(
    inputPath: "./output/india.png", 
    outputPath: "./output/png/", 
    outputFileExtension: "png")
    .tile(levels: (6...10))

  Tiler(
    inputPath: "./output/india.png", 
    outputPath: "./output/png8/", 
    outputFileExtension: "png") { tile in
      let image = tile.image.clone()!
      image.format = "PNG8"
      return image
    }
    .tile(levels: (6...10))
}
