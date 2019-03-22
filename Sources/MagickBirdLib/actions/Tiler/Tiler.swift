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

    let duplicatedImage = originalImage.clone()!

    let range = (0...maxLevel).reversed()
    range.forEach { level in
      doRow(image: duplicatedImage, at: level)
      duplicatedImage.resize(by: 0.5)
    }

    print("done Tiling")
  }

  private func doRow(image: Image, at level: Int) {
    var x = 0
    var y = 0
    var currentRow = 0
    var currentColumn = 0


  }
}
