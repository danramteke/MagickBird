import Foundation
import MagickWand

public struct Resolution: Equatable {

	public let x: Double
	public let y: Double

	public init(x: Double, y: Double) {
		self.x = x
		self.y = y
	}
}

extension Image {

	public var resolution: Resolution {
		get {
			var x: Double = 0
			var y: Double = 0
			MagickGetImageResolution(self.pointer, &x, &y)
			return Resolution(x: x, y: y)
		}
		set {
			MagickSetImageResolution(self.pointer, newValue.x, newValue.y)
		}
	}
}
