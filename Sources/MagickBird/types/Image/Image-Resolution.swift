import Foundation
import MagickWand

public struct Resolution {
	public let x: Double
	public let y: Double

	public init(x: Double, y: Double) {
		self.x = x
		self.y = y
	}
}

extension Image {
	
	public func setCompressionQuality(_ int: Int) {
		MagickSetImageCompressionQuality(self.pointer, int)
	}
	
	public func setResolution(_ resolution: Resolution) {
		MagickSetImageResolution(self.pointer, resolution.x, resolution.y)
	}
	
	public var resolution: Resolution {
		var x: Double = 0
		var y: Double = 0
		MagickGetImageResolution(self.pointer, &x, &y)
		return Resolution(x: x, y: y)
	}
	
	public func setDepth(_ a: Int) {
		MagickSetImageDepth(self.pointer, a)
	}
}
