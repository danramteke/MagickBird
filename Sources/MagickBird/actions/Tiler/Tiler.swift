import MagickWand
import Foundation

public protocol TilerDelegate: AnyObject {
	func didStart(level: Int)
}

public class Tiler {
	public let tileSide: Int

  let originalImage: Image
  let maxLevel: Int
	let filetype: String
  let writer: Writer

	weak var tilerDelegate: TilerDelegate?

	public init(inputPath: String, outputPath: String, tileSide: Int = 512, outputFiletype: String = "png") {
    self.writer = Writer(outputDir: outputPath)
    self.originalImage = Image(filePath: inputPath)!
		self.tileSide = tileSide
    self.maxLevel = originalImage.size.tilingTimes
    self.filetype = outputFiletype
  }

	public init(input: Image, writer: Writer, tileSide: Int = 512, outputFiletype: String = "png") {
    self.writer = writer
    self.originalImage = input
		self.tileSide = tileSide
    self.maxLevel = input.size.tilingTimes
    self.filetype = outputFiletype
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

    var x = 0
    while x < imageSize.width {
      position = position.resettingY
      var y = 0
      while y < imageSize.height {
        let tileImage = image.clone()!

        tileImage.crop(x: x, y: y, width: tileSide, height: tileSide)

				let tile = Tile(level: level, position: position, image: tileImage, filetype: self.filetype)
        writer.write(tile)

        y += tileSide
        position = position.incrementingY
      }
      x += tileSide
      position = position.incrementingX
    }
  }
}
