import MagickBird
import Foundation

MagickBirdContext {
  Tiler(inputPath: "./kitten.jpg", outputPath: "./output/").tile(levels: (10...13))
}
