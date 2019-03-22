import MagickWand
import Foundation

public class Tiler {
  public let tileSide = 512

  let originalImage: Image
  let maxLevel: Int
  let outputPath: String

  public init(inputPath: String, outputPath: String) {
    self.outputPath = outputPath
    self.originalImage = Image(filePath: inputPath)!
    self.maxLevel = originalImage.size.tilingTimes
  }

  public func tile() {
    print("Tiling...")
    print(originalImage.size)

    let maxLevel = originalImage.size.tilingTimes

    let duplicatedImage = originalImage.clone()!

    let range = (0...14).reversed()
    range.forEach { level in
      print(level)
    }

    print("done Tiling")
  }
}
