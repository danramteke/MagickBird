import MagickWand
import Foundation

public class Tiler {
  public let tileSide: Int
  
  let originalImage: Image
  let maxLevel: Int
  let writer: Writer
  let isQuiet: Bool

  let outputFilename: (Int, Int, Int) -> String
  let tileAdjustmentBlock: ((Tile) -> Image)?
  
  public init(inputPath: String, outputPath: String, tileSide: Int = 512, isQuiet: Bool = true, outputFilename: @escaping (Int, Int, Int) -> String = { zoom, x, y in "\(zoom)_\(x)_\(y).png" }, tileAdjustmentBlock: ( (Tile) -> Image)? = nil) {
    self.writer = Writer(outputDir: outputPath)
    self.originalImage = Image(filePath: inputPath)!
    self.tileSide = tileSide
    self.maxLevel = originalImage.size.tilingTimes
    self.outputFilename = outputFilename
    self.tileAdjustmentBlock = tileAdjustmentBlock
    self.isQuiet = isQuiet
  }
  
  public init(input: Image, writer: Writer, tileSide: Int = 512, isQuiet: Bool = true, outputFilename: @escaping (Int, Int, Int) -> String = { zoom, x, y in "\(zoom)_\(x)_\(y).png" }, tileAdjustmentBlock: ( (Tile) -> Image)? = nil) {
    self.writer = writer
    self.originalImage = input
    self.tileSide = tileSide
    self.maxLevel = input.size.tilingTimes
    self.outputFilename = outputFilename
    self.tileAdjustmentBlock = tileAdjustmentBlock
    self.isQuiet = isQuiet
  }
  
  public func tile(levels onlyLevels: ClosedRange<Int>? = nil) {
    (0...maxLevel)
      .reversed()
      .filter { onlyLevels?.contains($0) ?? true }
      .forEach { level in
        if !isQuiet { print("level \(level)")}
        
        makeTiles(for: originalImage, at: level)
        originalImage.resize(by: 0.5)
      }
  }
  
  private func makeTiles(for image: Image, at level: Int) {
    
    let imageSize = image.size
    var position: Tile.Position = .zero 
    var point: Point = .zero

    while point.x < imageSize.width {
      position = position.resettingY
      point = point.resettingY
      
      while point.y < imageSize.height {
        let tileImage = image.clone()!

        tileImage.crop(x: point.x, y: point.y, width: tileSide, height: tileSide)
        
        let tile = Tile(level: level, position: position, image: tileImage)
        let adjustedTileImage = tileAdjustmentBlock?(tile) ?? tile.image
        let filename: String = outputFilename(tile.level, tile.position.x, tile.position.y)
        try! writer.write(image: adjustedTileImage, to: filename)
        
        point = point.incrementingY(by: tileSide)
        position = position.incrementingY
      }
      point = point.incrementingX(by: tileSide)
      position = position.incrementingX
    }
  }
}
