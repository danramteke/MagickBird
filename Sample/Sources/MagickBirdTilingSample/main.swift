import MagickBird
import Foundation

MagickBirdContext {
  Tiler(
    inputPath: "./output/india.png", 
    outputPath: "./output/jpg/", 
    outputFilename: { zoom, x, y in "\(zoom)_\(x)_\(y).jpg"}) 
    .tile(levels: (6...10))

  Tiler(
    inputPath: "./output/india.png", 
    outputPath: "./output/png/")
    .tile(levels: (6...10))

  Tiler(
    inputPath: "./output/india.png", 
    outputPath: "./output/png8/") { tile in
      let image = tile.image.clone()!
      image.format = "PNG8"
      return image
    }
    .tile(levels: (6...10))
}
