import MagickBird
import Foundation

MagickBirdContext {
  Tiler(inputPath: "./Samples/subway_map.png", outputPath: "./Samples/output/").tile(levels: (10...13))
}
