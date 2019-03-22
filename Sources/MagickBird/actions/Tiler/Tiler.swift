import MagickWand
import Foundation

public class Tiler {
  public let tileSide = 512

  let originalImage: Image
  let maxLevel: Int
  let writer: Writer

  public init(inputPath: String, outputPath: String) {
    self.writer = Writer(outputDir: outputPath)
    self.originalImage = Image(filePath: inputPath)!
    self.maxLevel = originalImage.size.tilingTimes
  }

  public func tile(levels onlyLevels: ClosedRange<Int>? = nil) {
    print("Tiling...")
    print(originalImage.size)

    let levels = (0...maxLevel).reversed()
    levels.forEach { level in

      if let onlyLevels = onlyLevels {
        if onlyLevels.contains(level) {
          makeTiles(for: originalImage, at: level) 
        } else {
          print("level \(level) -- SKIPPED")
        }

      } else {
        makeTiles(for: originalImage, at: level) 
      }

      
      originalImage.resize(by: 0.5)
    }

    print("done Tiling")
  }

  private func makeTiles(for image: Image, at level: Int) {
    print("level \(level)")
    let imageSize = image.size

    var position: Tile.Position = .zero 


    var x = 0
    while x < imageSize.width {
      position = position.resettingY
      var y = 0
      while y < imageSize.height {
        let tileImage = image.clone()!

        tileImage.crop(x: x, y: y, width: tileSide, height: tileSide)

        let tile = Tile(level: level, position: position, image: tileImage)
        writer.write(tile)

        y += tileSide
        position = position.incrementingY
      }
      x += tileSide
      position = position.incrementingX
    }
    
  }
}
