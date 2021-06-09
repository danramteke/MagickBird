import MagickBird
import Foundation

MagickBirdContext {
  Tiler(inputPath: "./output/kitten.jpg", outputPath: "./output/").tile(levels: (10...13))
}
