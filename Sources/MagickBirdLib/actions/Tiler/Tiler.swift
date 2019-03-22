import MagickWandMac
import Foundation

public class Tiler {
  let inputPath: String
  let outputPath: String
  public init(inputPath: String, outputPath: String) {
    self.inputPath = inputPath
    self.outputPath = outputPath
  }
  public let tileSide = 512
  public func tile() {
    print("Tiling...")

    let image = Image(filePath: self.inputPath)!
    print(image.size)

    print("done Tiling")
  }
}

