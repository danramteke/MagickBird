import MagickWand
import Foundation

public protocol TilerDelegate: AnyObject {
	func didStart(level: Int)
}

public class Tiler {
	public let tileSide: Int

  let originalImage: Image
  let maxLevel: Int
	let fileExtension: String
  let format: String?
  let writer: Writer

	weak var tilerDelegate: TilerDelegate?

	public init(inputPath: String, outputPath: String, tileSide: Int = 512, outputFormat: String?, outputFileExtension: String = "png") {
    self.writer = Writer(outputDir: outputPath)
    self.originalImage = Image(filePath: inputPath)!
		self.tileSide = tileSide
    self.maxLevel = originalImage.size.tilingTimes
    self.format = outputFormat
    self.fileExtension = outputFileExtension
  }

	public init(input: Image, writer: Writer, tileSide: Int = 512, outputFormat: String?, outputFileExtension: String = "png") {
    self.writer = writer
    self.originalImage = input
		self.tileSide = tileSide
    self.maxLevel = input.size.tilingTimes
    self.format = outputFormat
    self.fileExtension = outputFileExtension
  }

  public func tile(levels onlyLevels: ClosedRange<Int>? = nil) {
		(0...maxLevel)
			.reversed()
			.filter { onlyLevels?.contains($0) ?? true }
			.forEach { level in

				makeTiles(for: originalImage, at: level)
				originalImage.resize(by: 0.5)
    }
  }

  private func makeTiles(for image: Image, at level: Int) {
		tilerDelegate?.didStart(level: level)

    let imageSize = image.size
    var position: Tile.Position = .zero 
    var point: Point = .zero


    while point.x < imageSize.width {
      position = position.resettingY
      
      while point.y < imageSize.height {
        let tileImage = image.clone()!

        tileImage.crop(x: point.x, y: point.y, width: tileSide, height: tileSide)

        if let format = self.format {
          tileImage.format = format 
        }
     
				let tile = Tile(level: level, position: position, image: tileImage)
        try! writer.write(image: tile.image, to: "\(tile.filestem).\(fileExtension)")

        point = point.incrementingY(by: tileSide)
        position = position.incrementingY
      }
      point = point.incrementingX(by: tileSide)
      position = position.incrementingX
    }
  }
}
