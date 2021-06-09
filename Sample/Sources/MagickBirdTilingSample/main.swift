import MagickBird
import Foundation

MagickBirdContext {
  Tiler(inputPath: "./output/kitten.jpg", outputPath: "./output/", outputFiletype: "jpg").tile(levels: (10...13))
  Tiler(inputPath: "./output/kitten.jpg", outputPath: "./output/", outputFiletype: "png").tile(levels: (10...13))
}
